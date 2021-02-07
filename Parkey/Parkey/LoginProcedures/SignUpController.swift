//
//  SignUpController.swift
//  Parkey
//
//  Created by Patrick Sammon on 2/7/21.
//  Copyright © 2021 iona. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //method to check that the password contains an uppercase Character
    
    func checkUpperCase(password: String) -> Bool{
        let set = CharacterSet.lowercaseLetters
        
        //check if it has any uppercase characters
        if let scala = UnicodeScalar(password) {
          return set.contains(scala)
        } else {
          return false
        }
    }
    //method to check that the password contains a special symbol
    func checkSymbol(password:String) -> Bool{
        let set = CharacterSet.symbols
        
        //check if it has any symbol characters
        if let scala = UnicodeScalar(password) {
          return set.contains(scala)
        } else {
          return false
        }
    }
    //method to check that the password contains a number
    func checkNumber(password:String)-> Bool{
        let set = CharacterSet.decimalDigits
        
        //check if it has any symbol characters
        if let scala = UnicodeScalar(password) {
          return set.contains(scala)
        } else {
          return false
        }
    }
}
