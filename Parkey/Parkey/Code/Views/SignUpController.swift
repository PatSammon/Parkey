//
//  SignUpController.swift
//  Parkey
//
//  Created by Patrick Sammon on 2/7/21.
//  Copyright © 2021 iona. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {

    //Outlet variables
    @IBOutlet weak var FName: UITextField!
    @IBOutlet weak var LName: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Password2: UITextField!
    @IBOutlet weak var ErrorMessage: UILabel!
    
    
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
    
    //method that will be called when the user tries to sign-up
    @IBAction func SignUp(_ sender: Any) {
        //check that the email is not in use
        
        //check that the password is the same for both entries
        if Password.text != Password2.text{
            //then prompt the user to reenter the password
            ErrorMessage.text = "Passwords do not match"
            ErrorMessage.isHidden=false
            return
        }
        
        //check that the password contains the necessary elements
        let passwordTemp = Password.text!
        if !checkNumber(password: passwordTemp) || !checkSymbol(password: passwordTemp) || !checkUpperCase(password: passwordTemp){
            //tell the user they must contain the proper format
            ErrorMessage.text = "Password must include a number, special character, and uppercase"
            ErrorMessage.isHidden=false
            return
        }
        
        //then add the entry to the database
    }
}
