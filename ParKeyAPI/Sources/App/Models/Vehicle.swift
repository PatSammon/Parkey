import Fluent
import Vapor
import FluentMongoDriver

final class Vehicle: Model, Content
{
    init() {}
    
    static let schema = "vehicle"
    
    @ID(custom: .id)
    var id: ObjectId?
    
    @Field(key: "userId")
    var userId: String
    
    @Field(key: "licensePlate")
    var licensePlate: String
    
    @Field(key: "make")
    var make: String
    
    @Field(key: "model")
    var model: String
    
    @Field(key: "size")
    var size: Int
    
    init(userId: String, licensePlate: String, make: String, model: String, size: Int)
    {
        self.id = ObjectId()
        self.userId = userId
        self.licensePlate = licensePlate
        self.make = make
        self.model = model
        self.size = size
    }
}

