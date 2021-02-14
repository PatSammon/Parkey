import Fluent

struct ParkingRulesFunctionality: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("parkingRules")
            .id()
            .field("parkingSpotId", .string, .required)
            .field("location", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("parkingRules").delete()
    }
}


