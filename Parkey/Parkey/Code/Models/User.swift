class User: Codable
{
    var id: String?
    var name: String
    var userName: String
    var password: String
    var phoneNum: Int
    var email: String
    var availablePoints: Int
    var totalPoints: Int
    
    init(name: String, userName: String, password: String, email: String, phoneNum: Int)
    {
        self.name = name
        self.userName = userName
        self.password = password
        self.email = email
        self.phoneNum = phoneNum
        availablePoints = 0
        totalPoints = 0
    }
}
