import Fluent
import FluentMongoDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    try app.databases.use(.mongo(
        connectionString: Environment.get("DATABASE_URL") ?? "mongodb://localhost:27017/parKey_db"
    ), as: .mongo)
    
    app.migrations.add(UserFunctionality())
    app.migrations.add(PaymentInfoFunctionality())
    app.migrations.add(VehicleFunctionality())
    app.migrations.add(RewardFunctionality())
    app.migrations.add(VinnyFunctionality())
    app.migrations.add(ParkingRulesFunctionality())
    app.migrations.add(ParkingSpotFunctionality())
    app.migrations.add(NavigationFunctionality())

    // register routes
    try routes(app)
}
