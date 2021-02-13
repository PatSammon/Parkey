class Vinny: Codable
{
    var id: String?
    var speechRecognizer: String
    var transcribedVoiceRecording: String
    var currentLocation: String
    var userId: String
    var vehicleId: String
    
    init(speechRecognizer: String, transcribedVoiceRecording: String, currentLocation: String, userId: String, vehicleId: String)
    {
        self.speechRecognizer = speechRecognizer
        self.transcribedVoiceRecording = transcribedVoiceRecording
        self.currentLocation = currentLocation
        self.userId = userId
        self.vehicleId = vehicleId
    }
}


