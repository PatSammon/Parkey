class ParkingSpot: Codable
{
    var id: String?
    var navigationId: String
    var currentLocation: String
    var available: Bool
    var timeAvailable: Int
    
    
    init(navigationId: String, currentLocation: String, available: Bool, timeAvailable: Int)
    {
        self.navigationId = navigationId
        self.currentLocation = currentLocation
        self.available = available
        self.timeAvailable = timeAvailable
    }
}

