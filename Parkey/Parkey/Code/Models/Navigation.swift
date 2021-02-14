class Navigation: Codable
{
    var id: String?
    var userId: String
    var currentLocation: String
    var desiredLocation: String
    var mapRadius: Double
    
    init(userId: String, currentLocation: String, desiredLocation: String, mapRadius: Double)
    {
        self.userId = userId
        self.currentLocation = currentLocation
        self.desiredLocation = desiredLocation
        self.mapRadius = mapRadius
    }
}
