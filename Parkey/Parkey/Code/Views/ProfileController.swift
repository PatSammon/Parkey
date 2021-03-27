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
    
    var profileVinny = Vinny()
    var timer: Timer = Timer()
    var timeLeft: Int = 3
    var speechInput: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speechInput = ""
    }
    
    @IBAction func micClicked(_ sender: Any) {
        profileVinny.speak(message: "What would you like to view?")
        profileVinny.listen()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerCountdown), userInfo: nil, repeats: true)
    }
    
    @objc func timerCountdown() {
        timeLeft -= 1
        if (timeLeft == 0) {
            timer.invalidate()
            profileVinny.endSpeechRecognition()
            speechInput = profileVinny.getMessage()
            readSpeechInput(message: speechInput!)
        }
    }
    
    func readSpeechInput(message: String) {
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
    
}
