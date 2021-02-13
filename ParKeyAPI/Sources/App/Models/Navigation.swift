import Fluent
import Vapor
import FluentMongoDriver

final class Navigation: Model, Content
{
    init() {}
    
    static let schema = "navigation"
    
    @ID(custom: .id)
    var id: ObjectId?
    
    @Field(key: "userId")
    var userId: String
    
    @Field(key: "currentLocation")
    var currentLocation: String
    
    @Field(key: "desiredLocation")
    var desiredLocation: String
    
    @Field(key: "mapRadius")
    var mapRadius: Double
    
    init(userId: String, currentLocation: String, desiredLocation: String, mapRadius: Double)
    {
        self.id = ObjectId()
        self.userId = userId
        self.currentLocation = currentLocation
        self.desiredLocation = desiredLocation
        self.mapRadius = mapRadius
    }
}


