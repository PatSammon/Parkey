class ParkingRules: Codable
{
    var id: String?
    var parkingSpotId: String
    var location: String
    
    init(parkingSpotId: String, location: String)
    {
        self.parkingSpotId = parkingSpotId
        self.location = location
    }
}
