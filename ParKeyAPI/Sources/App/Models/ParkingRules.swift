import Fluent
import Vapor
import FluentMongoDriver

final class ParkingRules: Model, Content
{
    init() {}
    
    static let schema = "parkingRules"
    
    @ID(custom: .id)
    var id: ObjectId?
    
    @Field(key: "parkingSpotId")
    var parkingSpotId: String
    
    @Field(key: "location")
    var location: String
    
    init(parkingSpotId: String, location: String)
    {
        self.id = ObjectId()
        self.parkingSpotId = parkingSpotId
        self.location = location
    }
}



