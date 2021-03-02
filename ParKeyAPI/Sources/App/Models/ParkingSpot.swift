import Fluent
import Vapor
import FluentMongoDriver

final class ParkingSpot: Model, Content
{
    init() {}
    
    static let schema = "parkingSpot"
    
    @ID(custom: .id)
    var id: ObjectId?
    
    @Field(key: "navigationId")
    var navigationId: String
    
    @Field(key: "currentLocation")
    var currentLocation: String
    
    @Field(key: "available")
    var available: Bool
    
    @Field(key: "timeAvailable")
    var timeAvailable: Int
    
    init(navigationId: String, currentLocation: String, available: Bool, timeAvailable: Int)
    {
        self.id = ObjectId()
        self.navigationId = navigationId
        self.currentLocation = currentLocation
        self.available = available
        self.timeAvailable = timeAvailable
    }
}




