import Fluent
import Vapor

func routes(_ app: Application) throws
{
    app.post("newUser")
    { req -> EventLoopFuture<User> in
        let user = try req.content.decode(User.self)
        return user.create(on: req.db).map{user}
    }
    
    app.post("loginUser")
    { req -> String in
        //decode the user login info
        
        var userName=""
        var password=""
        if req.headers.contains(name: "userName")
        {
            userName = req.headers.first(name: "userName")!
        }
        if req.headers.contains(name: "password"){
            password = req.headers.first(name: "password")!
        }
        
        //pose a query where it will find the user with that Username
        var info:EventLoopFuture<User?> = User.query(on: req.db).filter(\.$userName == userName).filter(\.$password == password).first()
        var flag = false
        info.whenComplete{ result in
            switch result{
            case .success(let userCred):
                if userCred != nil{
                    print(userCred)
                    flag = true
                }
            case .failure(let error):
                print(error)
            }
        }
        //this might work?
        return "Yes"
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
    
    try app.register(collection: UserController())
    try app.register(collection: PaymentInfoController())
    try app.register(collection: VehicleController())
    try app.register(collection: RewardController())
}
