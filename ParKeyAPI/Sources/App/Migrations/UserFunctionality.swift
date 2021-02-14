import Fluent

struct UserFunctionality: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("user")
            .id()
            .field("name", .string, .required)
            .field("userName", .string, .required)
            .field("password", .string, .required)
            .field("email", .string, .required)
            .field("phoneNum", .int, .required)
            .field("availablePoints", .int)
            .field("totalPoints", .int)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("user").delete()
    }
}
