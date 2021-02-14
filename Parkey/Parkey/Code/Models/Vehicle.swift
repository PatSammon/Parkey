class Vehicle: Codable
{
    var id: String?
    var userId: String
    var licensePlate: String
    var make: String
    var model: String
    var size: Int
    
    init(userId: String, licensePlate: String, make: String, model: String, size: Int)
    {
        self.userId = userId
        self.licensePlate = licensePlate
        self.make = make
        self.model = model
        self.size = size
    }
}
