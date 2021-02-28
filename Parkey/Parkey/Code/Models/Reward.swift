class Reward: Codable
{
    var id: String?
    var name: String
    var userId: String
    var cost: Int
    var redeemed: Bool
    
    init(userId: String, name: String, cost: Int)
    {
        self.userId = userId
        self.name = name
        self.cost = cost
        redeemed = false
    }
}

struct Rewards: Codable
{
    let userRewards: [Reward]
}
