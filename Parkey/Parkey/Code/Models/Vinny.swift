import AVFoundation
import UIKit
import Speech

class Vinny: NSObject
{
    var id: String?
    var speech: String
    var lastSpeech: String
    var finalSpeech: String
    var audioEngine = AVAudioEngine()
    let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    var recognitionRequest : SFSpeechAudioBufferRecognitionRequest?
    var task : SFSpeechRecognitionTask?
    var started : Bool = false
    var speaking: Bool = false
    var timer: Timer = Timer()
    var timeLeft: Int = 4
    
    override init() //gets authorization to record
    {
        speech = ""
        lastSpeech = ""
        finalSpeech = ""
        task?.cancel()
        self.task = nil
    }
    
    /*
     Takes a message as input and outputs with text to speech
     */
    func speak(message: String) {
            let utterance = AVSpeechUtterance(string: message)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            utterance.rate = 0.6
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
    }
    /*
     Gets permission to access mic and use speech recognition
     */
    func getPermission() {
        SFSpeechRecognizer.requestAuthorization{ authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                    case .authorized:
                        break

                    case .denied:
                        break
                            
                    case .restricted:
                        break
                              
                    case .notDetermined:
                        break
                              
                    default:
                        break
                }
            }
        }
    }
    
    
    func listen() {
        if (!started) {
            startSpeech()
        }
        else {
            endSpeechRecognition()
            startSpeech()
        }
    }
    
    
    
    func startSpeech() {
        started = true
        speech = ""
        let audioSession = AVAudioSession.sharedInstance()
       
        let node = audioEngine.inputNode
        
        do{
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        }catch{
            NSLog("audio session failed")
        }
        let recordFormat = node.outputFormat(forBus: 0)
        
        node.installTap(onBus: 0, bufferSize: 1024, format: recordFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            self.recognitionRequest?.append(buffer)
        }
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            NSLog("error starting audio engine")
        }
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else {
            NSLog("unable to create recognition request")
            return
        }
        started = true
        recognitionRequest.shouldReportPartialResults = true
        task = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (response, error) in
            if (response != nil) {
                self.speech = (response?.transcriptions[0].formattedString)!
            }
            if let response = response {
                self.speech = response.transcriptions[0].formattedString
            }
            if error != nil {
                self.audioEngine.stop()
                node.removeTap(onBus: 0)
                self.recognitionRequest = nil
                self.task = nil
            }
        })
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerCountdown), userInfo: nil, repeats: true)
    }
    
    /*
     Ends speech recognition, resetting all variables for the next usage if applicable
     */
    func endSpeechRecognition() {
        finalSpeech = speech
        speech = ""
        lastSpeech = ""
        task?.finish()
        task?.cancel()
        task = nil
        
        recognitionRequest?.endAudio()
        audioEngine.reset()
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        started = false
    }
    
    func getMessage() -> String {
        return speech
    }
    
    func getFinalMessage() -> String {
        return finalSpeech
    }
    
    func isStarted() -> Bool {
        return started
    }
    
    func isSpeaking() -> Bool {
        return speaking
    }
    
    @objc func timerCountdown() {
        timeLeft -= 1
        if (speech != lastSpeech) {
            timeLeft += 1
            lastSpeech = speech
        }
        if (timeLeft == 0) {
            timer.invalidate()
            timeLeft = 4
            endSpeechRecognition()
        }
    }
}
extension Vinny: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        self.speaking = true
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        self.speaking = false
        try? AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        self.speaking = false
        try? AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
    }
}
