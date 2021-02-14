import Fluent

struct NavigationFunctionality: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("navigation")
            .id()
            .field("userId", .string, .required)
            .field("currentLocation", .string, .required)
            .field("desiredLocation", .string, .required)
            .field("mapRadius", .double, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("navigation").delete()
    }
}
