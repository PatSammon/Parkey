import UIKit
import Speech

class SpeechController: UIViewController, SFSpeechRecognizerDelegate {

    @IBOutlet weak var speakButton: UIButton!
    
    @IBOutlet weak var showSpeech: UILabel!
    
    
    let audioEngine = AVAudioEngine()
    let speechRecognizer:SFSpeechRecognizer? = SFSpeechRecognizer()
    let recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
    var task : SFSpeechRecognitionTask!
    var started : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startOrStop(_ sender: Any) {
        started = !started
        if started {
            startSpeech()
            speakButton.setTitle("Stop", for: .normal)
            speakButton.backgroundColor = .systemRed
        }
        else {
            endSpeechRecognition()
            speakButton.setTitle("Start", for: .normal)
            speakButton.backgroundColor = .systemGreen
        }
    }
    
    
    func getPermission() {
        self.speakButton.isEnabled = false
        SFSpeechRecognizer.requestAuthorization { (authState) in
            OperationQueue.main.addOperation {
                if authState == .authorized {
                    print("Accepted")
                    self.speakButton.isEnabled = true
                }
                else if authState == .denied {
                    
                }
                else if authState == .notDetermined {
                    
                }
                else if authState == .restricted {
                    
                }
            }
        }
    }
    
    func startSpeech() {
        let node = audioEngine.inputNode
        let recordFormat = node.outputFormat(forBus: 0)
        node.removeTap(onBus: 0)
        node.installTap(onBus: 0, bufferSize: 1024, format: recordFormat) { (buffer, _) in
            self.recognitionRequest.append(buffer)
        }
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch let error {
            
        }
        guard let recognition = SFSpeechRecognizer() else {
            return
        }
        if !recognition.isAvailable {
            
        }
        task = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (response, error) in
            guard let response = response else {
                if error != nil {
                    
                }
                else {
                    
                }
                return
            }
            let speech = response.bestTranscription.formattedString
            self.showSpeech.text = speech
        })
    }
    
    func endSpeechRecognition() {
        task.finish()
        task.cancel()
        task = nil
        
        recognitionRequest.endAudio()
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
    }
    
}
