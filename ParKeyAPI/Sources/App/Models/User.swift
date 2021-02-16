import Fluent
import Vapor
import FluentMongoDriver

@dynamicMemberLookup
final class User: Model, Content
{
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
    subscript(dynamicMember member: String) -> String {
        let properties = ["userName": self.userName, "password": self.password]
        return properties[member, default: ""]
    }
}

