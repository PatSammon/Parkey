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
    
    //global variables
    var loginDone = false
    var loginSuccess = false
    var error = ""
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //method to check that the password contains an uppercase Character
    
    func checkUpperCase(password: String) -> Bool{
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z]")
        if let _ = regex.firstMatch(in: password, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, password.count)) {
                return true
            }

        } catch {
            debugPrint(error.localizedDescription)
            return false
        }

        return false
    }
    //method to check that the password contains a special symbol
    func checkSymbol(password:String) -> Bool{
       do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: .caseInsensitive)
        if let _ = regex.firstMatch(in: password, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, password.count)) {
                return true
            }

        } catch {
            debugPrint(error.localizedDescription)
            return false
        }

        return false
    }
    //method to check that the password contains a number
    func checkNumber(password:String)-> Bool{
        do {
            let regex = try NSRegularExpression(pattern: "[0-9]")
        if let _ = regex.firstMatch(in: password, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, password.count)) {
                return true
            }

        } catch {
            debugPrint(error.localizedDescription)
            return false
        }

        return false
    }
    
    //method that will be called when the user tries to sign-up
    @IBAction func SignUp(_ sender: Any) {
        //check that none of the fields are blank
        if Email.text == nil || Password.text == nil || Password2.text == nil || FName.text == nil || LName.text == nil{
            ErrorMessage.text = "Must include all fields"
            ErrorMessage.isHidden=false
            return
        }
        
        //check that the email is not in use
        
        
        //check that the password is the same for both entries
        if Password.text != Password2.text && Password.text != nil{
            //then prompt the user to reenter the password
            ErrorMessage.text = "Passwords do not match"
            ErrorMessage.isHidden=false
            return
        }
        
        //check that the password contains the necessary elements
        let passwordTemp = Password.text!
        if !checkSymbol(password: passwordTemp) || !checkUpperCase(password: passwordTemp) || !checkNumber(password: passwordTemp){
            //tell the user they must contain the proper format
            ErrorMessage.text = "Password must include a number, special character, and uppercase"
            ErrorMessage.isHidden=false
            return
        }
        let name:String = FName.text! + LName.text!
        //then add the entry to the database
        RequestHandler.register(name: name, userName: Email.text!, password: Password.text!, email: Email.text!, phoneNum: 1234567) {
                Result in
                switch Result{
                case .success(let response):
                    //make the call to go to home
                    if response.1!.keys.contains("reason"){
                        self.loginDone = true
                        //todo make the error message pop up
                        self.ErrorMessage.text = response.1!["reason"] as! String
                    }
                    else{
                        self.loginDone = true
                        self.loginSuccess = true
                        let answer:Dictionary = response.1!["user"]! as! Dictionary<String, String>
                        self.id = answer["id"]!
                        
                        RequestHandler.addReward(userId: self.id, name: "Reward #1", cost: 200)
                        RequestHandler.addReward(userId: self.id, name: "Reward #2", cost: 300)
                        RequestHandler.addReward(userId: self.id, name: "Reward #3", cost: 400)
                        RequestHandler.addReward(userId: self.id, name: "Reward #4", cost: 500)
                        RequestHandler.addReward(userId: self.id, name: "Reward #5", cost: 550)
                    }
                case .failure(let error):
                    //todo
                    self.loginDone=true
                    self.ErrorMessage.text = error.localizedDescription
                }
            
            /*(result,error) in
                   if let result = result{
                       print("Success: \(result)")
                   }
                   else if let error = error{
                       //self.IncorrectCredentials.text = error.localizedDescription
                       print("error: \(error.localizedDescription)")
            }*/}
        
        //if the erro message was showing, make it hidden
        if !ErrorMessage.isHidden{
            ErrorMessage.isHidden=true
        }
        //set the user defaults
        /*UserDefaults.standard.set(true, forKey: "LoggedIn")
        UserDefaults.standard.set(Email.text!, forKey: "Email")
        UserDefaults.standard.set(Password.text!, forKey: "Password")
        */
        //seque
        //todo
        while !loginDone {
            sleep(1)
        }
        if loginSuccess{
            UserDefaults.standard.set(true, forKey: "LoggedIn")
            UserDefaults.standard.set(Email.text!, forKey: "Email")
            UserDefaults.standard.set(Password.text!, forKey: "Password")
            UserDefaults.standard.set(id, forKey: "UserID")
            goToDifferentView()
        }
        else{
            //todo
            print("Unsuccessful")
            loginDone = false
            ErrorMessage.isHidden = false
        }
    }
    //function that will perform the segue
    @objc func goToDifferentView(){
        self.performSegue(withIdentifier: "SignupSegue", sender: self)
    }
}
