import Fluent

struct ParkingSpotFunctionality: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("parkingSpot")
            .id()
            .field("longitude", .float, .required)
            .field("latitude", .float, .required)
            .field("available", .bool, .required)
            .field("timeAvailable", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("parkingSpot").delete()
    }
}


