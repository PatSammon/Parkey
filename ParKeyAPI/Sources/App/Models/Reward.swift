import Fluent
import Vapor
import FluentMongoDriver

final class Reward: Model, Content
{
    init() {}
    
    static let schema = "reward"
    
    @ID(custom: .id)
    var id: ObjectId?
    
    @Field(key: "userId")
    var userId: String
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "cost")
    var cost: Int
    
    @Field(key: "redeemed")
    var redeemed: Bool
    
    init(userId: String, name: String, cost: Int)
    {
        self.id = ObjectId()
        self.userId = userId
        self.name = name
        self.cost = cost
        redeemed = false
    }
}

