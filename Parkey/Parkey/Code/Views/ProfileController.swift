//
//  ProfileController.swift
//  Parkey
//
//  Created by user188405 on 2/14/21.
//  Copyright © 2021 iona. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var accountButton: UIButton!
    
    @IBOutlet weak var keychainButton: UIButton!
    
    @IBOutlet weak var rankingButton: UIButton!
    
    @IBOutlet weak var micButton: UIButton!
    
    @IBOutlet weak var speechShow: UITextView!
    
    var profileVinny = Vinny()
    var timer: Timer = Timer()
    var timeLeft: Int = 4
    var speechInput: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speechInput = ""
        speechShow.isHidden = true
        speechShow.text = ""
    }
    
    @IBAction func micClicked(_ sender: Any) {
        micButton.isEnabled = false
        //speechShow.isHidden = false
        profileVinny.getPermission()
        profileVinny.speak(message: "What would you like to view?")
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { speechTimer in
            self.speechShow.text = "Recording started"
            self.profileVinny.listen()
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerCountdown), userInfo: nil, repeats: true)
        }
    }
    
    
    @IBAction func keychainClicked(_ sender: Any) {
        /*if (profileVinny.authorized) {
            micButton.isEnabled = true
        }*/
    }
    
    func readSpeechInput(message: String) {
        speechShow.text = ""
        speechInput = ""
        micButton.isEnabled = true
        let noCaseMessage = message.lowercased()
        if (noCaseMessage.contains("account") || noCaseMessage.contains("profile") || noCaseMessage.contains("setting") ) {
            performSegue(withIdentifier: "settingsSegue", sender: self)
        }
        else if (noCaseMessage.contains("ranking") || noCaseMessage.contains("leaderboard")) {
            performSegue(withIdentifier: "rankingSegue", sender: self)
        }
        else {
            profileVinny.speak(message: "I did not understand your message, please try again")
        }
        
    }
    
    @objc func timerCountdown() {
        timeLeft -= 1
        if (profileVinny.isStarted()) {
            if (profileVinny.getMessage() != "") {
                speechShow.text = profileVinny.getMessage()
            }
            timeLeft += 1
        }
        else {
            timer.invalidate()
            timeLeft = 4
            speechInput = profileVinny.getFinalMessage()
            speechShow.isHidden = true
            readSpeechInput(message: speechInput!)
        }
    }
   
    
}
