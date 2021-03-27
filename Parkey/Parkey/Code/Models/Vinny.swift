import AVFoundation
import UIKit
import Speech

class Vinny
{
    var id: String?
    var speech: String
    var audioEngine = AVAudioEngine()
    let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    var recognitionRequest : SFSpeechAudioBufferRecognitionRequest?
    var task : SFSpeechRecognitionTask!
    var started : Bool = false
    var authorized : Bool = false
    
    
    init()
    {
        speech = ""
        task?.cancel()
        self.task = nil
    }
    
    func speak(message: String) {
        let utterance = AVSpeechUtterance(string: message)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.4
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    func getPermission() {
        SFSpeechRecognizer.requestAuthorization{ authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                    case .authorized:
                        self.authorized = true
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
        getPermission()
        if (!authorized) {
            print("not authorized")
            return
        }
        if (!started) {
            startSpeech()
        }
        else {
            endSpeechRecognition()
            startSpeech()
        }
    }
    
    
    
    func startSpeech() {
        speech = ""
        let audioSession = AVAudioSession.sharedInstance()
       
        let node = audioEngine.inputNode
        
        do{
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        }catch{
            print("audio session failed")
        }
        /*if(node.inputFormat(forBus: 0).channelCount == 0){
            NSLog("not enough available input")
            return
        }*/
        let recordFormat = node.outputFormat(forBus: 0)
        
        node.installTap(onBus: 0, bufferSize: 1024, format: recordFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            self.recognitionRequest?.append(buffer)
        }
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            print("error starting audio engine")
        }
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else {
            print("unable to create recognition request")
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
    }
    
    func endSpeechRecognition() {
        task.finish()
        task.cancel()
        task = nil
        
        recognitionRequest?.endAudio()
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        print(speech)
        started = false
    }
    
    func getMessage() -> String {
        return speech
    }
}
