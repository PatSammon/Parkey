import Fluent
import Vapor
import FluentMongoDriver

final class Places: Model, Content
{
    init() {}
    
    static let schema = "places"
    
    @ID(custom: .id)
    var id: ObjectId?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "cost")
    var cost: Int
    
    @Field(key: "coordinates")
    var coordinates: [Float]
    
    init(name: String, cost: Int, coordinates: [Float])
    {
        self.id = ObjectId()
        self.name = name
        self.cost = cost
        self.coordinates = coordinates
    }
}

