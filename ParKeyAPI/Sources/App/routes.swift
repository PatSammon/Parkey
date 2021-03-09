import Fluent
import Vapor
import FluentMongoDriver

func routes(_ app: Application) throws
{
    app.post("newUser")
    { req -> EventLoopFuture<User> in
        let user = try req.content.decode(User.self)
        return user.create(on: req.db).map{user}
    }
    
    app.post("userRewards")
    { req -> EventLoopFuture<[Reward]> in
        
        let userId = String(req.body.string!.dropFirst(7))
        
        return Reward.query(on: req.db).filter(\.$userId == userId).all()
    }
    
    
    app.post("userRewards")
    { req -> EventLoopFuture<[Reward]> in
        
        let userId = String(req.body.string!.dropFirst(7))
        
        return Reward.query(on: req.db).filter(\.$userId == userId).all()
    }
    
    app.post("newPaymentInfo")
    { req -> EventLoopFuture<PaymentInfo> in
        let payment = try req.content.decode(PaymentInfo.self)
        return payment.create(on: req.db).map{payment}
    }
    
    app.post("newVehicle")
    { req -> EventLoopFuture<Vehicle> in
        let vehicle = try req.content.decode(Vehicle.self)
        return vehicle.create(on: req.db).map{vehicle}
    }
    
    app.post("newReward")
    { req -> EventLoopFuture<Reward> in
        let reward = try req.content.decode(Reward.self)
        return reward.create(on: req.db).map{reward}
    }
    app.post("newPlace")
    { req -> EventLoopFuture<Places> in
        let place = try req.content.decode(Places.self)
        return place.create(on: req.db).map{place}
    }
    
    app.post("newParkingSpot")
    { req -> EventLoopFuture<ParkingSpot> in
        let spot = try req.content.decode(ParkingSpot.self)
        return spot.create(on: req.db).map{spot}
    }
    
    app.post("newParkingRules")
    { req -> EventLoopFuture<ParkingRules> in
        let rule = try req.content.decode(ParkingRules.self)
        return rule.create(on: req.db).map{rule}
    }
    
    app.post("removeReward")
    { req -> EventLoopFuture<HTTPStatus> in
        
        let rewardId = ObjectId(String(req.body.string!.dropFirst(9)))
        
        let reward = Reward.query(on: req.db).filter(\.$id == rewardId!)
        
        return reward.delete().transform(to: HTTPStatus.ok)
    }
    
    app.post("newNavigation")
    { req -> EventLoopFuture<Navigation> in
        let nav = try req.content.decode(Navigation.self)
        return nav.create(on: req.db).map{nav}
    }
    
    app.post("newRequest")
    { req -> EventLoopFuture<Vinny> in
        let request = try req.content.decode(Vinny.self)
        return request.create(on: req.db).map{request}
    }
    
    app.get("users")
    {
        req in
        
        User.query(on: req.db).all()
    }
    app.get("places")
    {
        req in
        
        Places.query(on: req.db).all()
    }
    
    try app.register(collection: UserController())
    try app.register(collection: PaymentInfoController())
    try app.register(collection: VehicleController())
    try app.register(collection: RewardController())
}
