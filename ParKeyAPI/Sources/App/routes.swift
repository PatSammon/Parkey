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
    
    app.post("getVehicle")
    {
        req -> EventLoopFuture<[Vehicle]> in
      
        let userId = String(req.body.string!.dropFirst(7))
    
        return Vehicle.query(on: req.db).filter(\.$userId == userId).all()
    }
    
    /*app.get("leaderboard")
    {
        req -> EventLoopFuture<[User]> in
        return User.query(on: req.db).sort(\.$totalPoints, .descending).range(..<5).all()
    }*/
    
    app.get("leaderboard")
    {
        req -> EventLoopFuture<[User]> in
        return User.query(on: req.db).sort(\.$totalPoints, .descending).filter(\.$totalPoints != 0).all()
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
    //Laydon
    
 //   app.get("getVehicle")
   // {
    //    req -> EventLoopFuture<[User]> in
    //    return //User.query(on: req.db).sort(<#T##field: KeyPath<User, QueryableProperty>##KeyPath<User, QueryableProperty>#>)
  //  }
    

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
    
    app.post("removeVehicle")
    { req -> EventLoopFuture<HTTPStatus> in
        let vehicleId = ObjectId(String(req.body.string!.dropFirst(1)))
        let vehicle = Vehicle.query(on: req.db).filter(\.$id == vehicleId!)
        return vehicle.delete().transform(to: HTTPStatus.ok)
    }
    
    app.post("removeParkingSpot")
    { req -> EventLoopFuture<HTTPStatus> in
        let var1 = String(req.body.string!)
        let infoArray = var1.split(separator: "&")
        let furtherInfoArray = infoArray[0].split(separator: "=")
        let furtherInfoArray2 = infoArray[1].split(separator: "=")
        let parkingLong = (String(furtherInfoArray2[1]) as NSString).floatValue
        let parkingLat = (String(furtherInfoArray[1]) as NSString).floatValue
        
        let parkingSpot = ParkingSpot.query(on: req.db).filter(\.$latitude == parkingLat).filter(\.$longitude == parkingLong)
        //let parkingSpot2 = ParkingSpot.query(on: req.db).filter(\.$id == parkingId!)
        
        return parkingSpot.delete().transform(to: HTTPStatus.ok)
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
    app.get("parkingSpots")
    {
        req in
        
        ParkingSpot.query(on: req.db).all()
    }
    
    try app.register(collection: UserController())
    try app.register(collection: PaymentInfoController())
    try app.register(collection: VehicleController())
    try app.register(collection: RewardController())
}
