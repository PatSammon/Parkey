class ParkingSpot: Codable
{
    var latitude: Float
    var longitude: Float
    var available: Bool
    var timeAvailable: String
    
    
    init( latitude: Float, longitude: Float, available: Bool, timeAvailable: String)
    {
        self.latitude = latitude
        self.longitude = longitude
        self.available = available
        self.timeAvailable = timeAvailable
    }
}

