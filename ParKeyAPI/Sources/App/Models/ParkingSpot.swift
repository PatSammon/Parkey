import Fluent
import Vapor
import FluentMongoDriver

final class ParkingSpot: Model, Content
{
    init() {}
    
    static let schema = "parkingSpot"
    
    @ID(custom: .id)
    var id: ObjectId?
    
    @Field(key: "latitude")
    var latitude: Float
    
    @Field(key: "longitude")
    var longitude: Float
    
    @Field(key: "available")
    var available: Bool
    
    @Field(key: "timeAvailable")
    var timeAvailable: String
    
    init(latitude: Float,longitude: Float, available: Bool, timeAvailable: String)
    {
        self.id = ObjectId()
        self.latitude = latitude
        self.longitude = longitude
        self.available = available
        self.timeAvailable = timeAvailable
    }
}




