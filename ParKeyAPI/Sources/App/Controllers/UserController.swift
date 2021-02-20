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


struct UserController: RouteCollection
{
    func boot(routes: RoutesBuilder) throws
    {
        let users = routes.grouped("user")
        users.get(use: index)
        users.post(use: create)
        users.group(":userID") { user in
            user.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[User]> {
        return User.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<User> {
        let user = try req.content.decode(User.self)
        return user.save(on: req.db).map { user }
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
    
    func getMyOwnUser(req:Request) throws -> User.Public{
        try req.auth.require(User.self).asPublic()
    }
}
