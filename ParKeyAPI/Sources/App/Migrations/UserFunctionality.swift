import Fluent

struct UserFunctionality: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("user")
            .id()
            .field("name", .string, .required)
            .field("age", .int, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("user").delete()
    }
}
