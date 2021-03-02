import Fluent

struct ParkingSpotFunctionality: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("parkingSpot")
            .id()
            .field("navigationId", .string, .required)
            .field("currentLocation", .string, .required)
            .field("available", .bool, .required)
            .field("timeAvailable", .int, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("parkingSpot").delete()
    }
}


