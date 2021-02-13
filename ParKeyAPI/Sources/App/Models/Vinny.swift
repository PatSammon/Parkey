import Fluent
import Vapor
import FluentMongoDriver

final class Vinny: Model, Content
{
    init() {}
    
    static let schema = "vinny"
    
    @ID(custom: .id)
    var id: ObjectId?
    
    @Field(key: "speechRecognizer")
    var speechRecognizer: String
    
    @Field(key: "transcribedVoiceRecording")
    var transcribedVoiceRecording: String
    
    @Field(key: "currentLocation")
    var currentLocation: String
    
    @Field(key: "userId")
    var userId: String
    
    @Field(key: "vehicleId")
    var vehicleId: String
    
    init(speechRecognizer: String, transcribedVoiceRecording: String, currentLocation: String, userId: String, vehicleId: String)
    {
        self.id = ObjectId()
        self.speechRecognizer = speechRecognizer
        self.transcribedVoiceRecording = transcribedVoiceRecording
        self.currentLocation = currentLocation
        self.userId = userId
        self.vehicleId = vehicleId
    }
}
