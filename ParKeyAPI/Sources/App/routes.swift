import Fluent
import Vapor

func routes(_ app: Application) throws
{
    app.post("newUser")
    { req -> EventLoopFuture<User> in
        let user = try req.content.decode(User.self)
        return user.create(on: req.db).map{user}
    }
    
    app.get("users")
    {
        req in
        
        User.query(on: req.db).all()
    }
    
    try app.register(collection: UserController())
}
