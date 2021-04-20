import Fluent
import Vapor

struct NewSession: Content{
    let token:String
    let user:User.Public
}
struct UserSignup: Content{
    let username:String
    let password:String
    let name:String
}
struct UserPointsInfo: Content{
    let TotalPoints:Int
    let AvailablePoints:Int
}
extension UserSignup: Validatable {
  static func validations(_ validations: inout Validations) {
    validations.add("username", as: String.self, is: !.empty)
    validations.add("password", as: String.self, is: .count(6...))
  }
}

struct UserController: RouteCollection
{
    func boot(routes: RoutesBuilder) throws
    {
        let users = routes.grouped("user")
        users.get(use: index)
        users.post("signup",use: create)
        users.group(":userID") { user in
            user.delete(use: delete)
        }
        let tokenProtected = users.grouped(Token.authenticator())
        tokenProtected.get("me", use: getMyOwnUser)
        
        let passwordProtected = users.grouped(User.authenticator())
        passwordProtected.post("login", use: login)
        passwordProtected.post("addPoints", use: addPoints)
        passwordProtected.post("spendPoints", use: spendPoints)
        passwordProtected.post("getPoints", use:getPoints)
    }

    func index(req: Request) throws -> EventLoopFuture<[User]> {
        return User.query(on: req.db).all()
    }

    /*func create(req: Request) throws -> EventLoopFuture<User> {
        let user = try req.content.decode(User.self)
        return user.save(on: req.db).map { user }
    }*/
    fileprivate func create(req: Request) throws -> EventLoopFuture<NewSession> {
        try UserSignup.validate(content: req)
      let userSignup = try req.content.decode(UserSignup.self)
      let user = try User.create(from: userSignup)
      var token: Token!

      return checkIfUserExists(userSignup.username, req: req).flatMap { exists in
        guard !exists else {
          return req.eventLoop.future(error: UserError.usernameTaken)
        }

        return user.save(on: req.db)
      }.flatMap {
        guard let newToken = try? user.createToken(source: .signup) else {
          return req.eventLoop.future(error: Abort(.internalServerError))
        }
        token = newToken
        return token.save(on: req.db)
      }.flatMapThrowing {
        NewSession(token: token.value, user: try user.asPublic())
      }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return User.find(req.parameters.get("userID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
    //Function that will check if the username exists in the database
    private func checkIfUserExists(_ username:String, req: Request) -> EventLoopFuture<Bool>{
        User.query(on: req.db)
            .filter(\.$userName == username)
            .first()
            .map{$0 != nil}
    }
    
    //function to login
    
    fileprivate func login(req: Request) throws -> EventLoopFuture<NewSession>{
        let user = try req.auth.require(User.self)
        let token = try user.createToken(source: .login)
        
        return token.save(on: req.db).flatMapThrowing{
            NewSession(token: token.value, user: try user.asPublic())
        }
    }
    
    //function to add points to user
    fileprivate func addPoints(req: Request) throws -> EventLoopFuture<User>{
        //check that the information there is not blank
        var points = 0
        if req.headers.contains(name: "Points")
        {
            points = Int(req.headers.first(name: "Points")!) ?? 10
        }
        let user = try req.auth.require(User.self)
        user.$availablePoints.value! += points
        user.$totalPoints.value! += points
        return user.save(on: req.db).map{user}
    }
    //function to add points to user
    fileprivate func spendPoints(req: Request) throws -> EventLoopFuture<User>{
        //check that the information there is not blank
        var points = 0
        if req.headers.contains(name: "Points")
        {
            points = Int(req.headers.first(name: "Points")!) ?? 10
        }
        let user = try req.auth.require(User.self)
        user.$availablePoints.value! -= points
        return user.save(on: req.db).map{user}
    }
    
    //function to get the available
    fileprivate func getPoints(req: Request) throws -> User.Points{
        let user = try req.auth.require(User.self)
        return try user.asUserPoints()
    }
    
    func getMyOwnUser(req:Request) throws -> User.Public{
        try req.auth.require(User.self).asPublic()
    }
}
