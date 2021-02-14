import Fluent

struct RewardFunctionality: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("reward")
            .id()
            .field("userId", .string, .required)
            .field("name", .string, .required)
            .field("cost", .int, .required)
            .field("redeemed", .bool, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("reward").delete()
    }
}


