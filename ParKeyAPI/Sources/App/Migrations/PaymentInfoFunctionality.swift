import Fluent

struct PaymentInfoFunctionality: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("paymentInfo")
            .id()
            .field("userId", .string, .required)
            .field("cardNumber", .int, .required)
            .field("cardType", .string, .required)
            .field("expirationDate", .string, .required)
            .field("CVV", .int, .required)
            .field("postalCode", .int, .required)
            .field("city", .string, .required)
            .field("state", .string, .required)
            .field("address", .string, .required)
            .field("address2", .string)
            .field ("nameOnCard", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("paymentInfo").delete()
    }
}

