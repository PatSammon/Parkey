class Place: Codable
{
    var id: String?
    var name: String
    var cost: Int
    var coordinates: [Float]
    
    init(name: String, cost: Int, coordinates: [Float])
    {
        self.name = name
        self.cost = cost
        self.coordinates = coordinates
    }
}
