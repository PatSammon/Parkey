import Fluent

struct VinnyFunctionality: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("vinny")
            .id()
            .field("speechRecognizer", .string, .required)
            .field("transcribedVoiceRecording", .string, .required)
            .field("currentLocation", .string, .required)
            .field("userId", .string, .required)
            .field("vehicleId", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void>
    {
        return database.schema("vinny").delete()
    }
}


