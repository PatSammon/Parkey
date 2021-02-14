class UserLogin: Codable
{
    var userName: String
    var password: String
    
    init(userName: String, password: String)
    {
        self.userName = userName
        self.password = password
    }
}
