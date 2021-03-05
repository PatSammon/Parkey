import Fluent
import Vapor
import FluentMongoDriver

final class User: Model, Content
{
    struct Public: Content{
        let username: String
        let id: ObjectId
        let createdAt: Date?
        let updatedAt: Date?
    }
    struct Points: Content{
        let availablePoints: Int
    }
    
    init() {}
    
    static let schema = "user"
    
    @ID(custom: .id)
    var id: ObjectId?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "userName")
    var userName: String
    
    @Field(key: "password")
    var password: String
    
    @Field(key: "phoneNum")
    var phoneNum: Int
    
    @Field(key: "email")
    var email: String
    
    @Field(key: "availablePoints")
    var availablePoints: Int
    
    @Field(key: "totalPoints")
    var totalPoints: Int
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init(name: String, userName: String, password: String, email: String, phoneNum: Int)
    {
        self.id = ObjectId()
        self.name = name
        self.userName = userName
        self.password = password
        self.email = email
        self.phoneNum = phoneNum
        availablePoints = 0
        totalPoints = 0
    }
    init(name: String, userName: String, password: String)
    {
        self.id = ObjectId()
        self.name = name
        self.userName = userName
        self.password = password
        self.email = userName
        self.phoneNum = 111111111
        availablePoints = 0
        totalPoints = 0
    }
}
extension User{
    /*static func create(from userSignup: UserSignup) throws -> User{
        User(name: userSignup.name, userName: userSignup.username, password: userSignup.password)
    }*/
    static func create(from userSignup: UserSignup) throws -> User {
        User(name: userSignup.name, userName: userSignup.username, password: try Bcrypt.hash(userSignup.password))
    }
    
    func createToken(source: SessionSource) throws -> Token{
        let calendar = Calendar(identifier: .gregorian)
        let expiryDate = calendar.date(byAdding: .year,value: 1, to: Date())
        return try Token(userId:requireID(), token:[UInt8].random(count: 16).base64, source: source, expiresAt:expiryDate)
    }
    func asPublic() throws -> Public{
        Public(username:userName,
               id: try requireID(),
               createdAt: createdAt,
               updatedAt: updatedAt)
    }
    func asUserPoints() throws -> Points{
        Points(availablePoints: availablePoints)
    }
}

extension User: ModelAuthenticatable{
    static let usernameKey=\User.$userName
    static let passwordHashKey = \User.$password
    
    func verify(password: String) throws -> Bool {
      try Bcrypt.verify(password, created: self.password)
    }
}

