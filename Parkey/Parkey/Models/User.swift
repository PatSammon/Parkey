class User: Codable
{
    var name: String
    var age: Int
    var id: String?
    
    init(name: String, age: Int)
    {
        self.name = name
        self.age = age
    }
}
