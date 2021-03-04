//
//  InitalScreenController.swift
//  Parkey
//
//  Created by Patrick Sammon on 2/23/21.
//  Copyright © 2021 iona. All rights reserved.
//

import UIKit

class InitialScreenController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // check if it should auto-sign in
        if UserDefaults.standard.bool(forKey: "LoggedIn"){
            goToDifferentView()
        }
    }
    
    @objc func goToDifferentView(){
        self.performSegue(withIdentifier: "AutoLoginSegue", sender: self)
    }
}
