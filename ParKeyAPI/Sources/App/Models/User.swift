import Fluent
import Vapor
import FluentMongoDriver

final class User: Model, Content
{
    init() {}
    
    static let schema = "user"
    
    @ID(custom: .id)
    var id: ObjectId?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "age")
    var age: Int
    
    init(name: String, age: Int)
    {
        self.id = ObjectId()
        self.name = name
        self.age = age
    }
}

