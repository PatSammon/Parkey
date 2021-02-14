import Fluent

struct VehicleFunctionality: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("vehicle")
            .id()
            .field("userId", .string, .required)
            .field("licensePlate", .string, .required)
            .field("make", .string, .required)
            .field("model", .string, .required)
            .field("size", .int, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("vehicle").delete()
    }
}
