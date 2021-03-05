class Vehicle: Codable
{
    var id: String?
    var userId: String
    var licensePlate: String
    var makeModel: String
    var size: Int
    var color: String
    
    init(userId: String, licensePlate: String, makeModel: String, color: String, size: Int)
    {
        self.userId = userId
        self.licensePlate = licensePlate
        self.makeModel = makeModel
        self.color = color
        self.size = size
    }
}
