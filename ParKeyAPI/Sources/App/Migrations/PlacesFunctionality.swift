import Fluent

struct PlacesFunctionality: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("places")
            .id()
            .field("name", .string, .required)
            .field("cost", .int, .required)
            .field("coordinates", .array, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("places").delete()
    }
}


