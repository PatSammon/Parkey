//
//  ViewController.swift
//  Parkey
//
//  Created by Patrick Sammon on 2/3/21.
//  Copyright © 2021 iona. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Storyboard variables
    
    //These variables will be used when the user is trying to "login"
    @IBOutlet weak var EmailLogin: UITextField!
    @IBOutlet weak var PasswordLogin: UITextField!
    //this will pop up if the login fails
    @IBOutlet weak var IncorrectCredentials: UILabel!
    var users = [User]()
    
    // global variables
    var loginDone = false
    var loginSuccess = false
    var error = ""
    var id = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //check if the user was already logged in
        if UserDefaults.standard.bool(forKey: "LoggedIn"){
            goToDifferentView()
            
        }
    }
    
    /*
     This is the function that will be run when the user is trying to login to the app.
     */
    @IBAction func Login(_ sender: Any) {
        //check the email exists within the database
        let email = EmailLogin.text!
        //check the password is the proper one for the email
        let password = PasswordLogin.text!
        
        //if the information is correct, then use the segue to continue to the app
        RequestHandler.sign_in(userName: email, password: password) { Result in
            switch Result{
            case .success(let response):
                //make the call to go to home
                if response.1!.keys.contains("reason"){
                    self.loginDone = true
                    //todo make the error message pop up
                    self.error = response.1!["reason"] as! String
                }
                else{
                    print(response)
                    self.loginDone = true
                    self.loginSuccess = true
                    let answer:Dictionary = response.1!["user"]! as! Dictionary<String, String>
                    self.id = answer["id"]!
                }
            case .failure(let error):
                //todo
                self.loginDone=true
                self.error = error.localizedDescription
            }
            
            
            /*
            if let Result.su = result{
                print("Success: \(result)")
            }
            else if let error = error{
                self.IncorrectCredentials.text = error.localizedDescription
                self.IncorrectCredentials.isHidden = false
                print("error: \(error.localizedDescription)")
            }*/
        }
        while !loginDone {
            sleep(1)
        }
        if loginSuccess{
            UserDefaults.standard.set(true, forKey: "LoggedIn")
            UserDefaults.standard.set(email, forKey: "Email")
            UserDefaults.standard.set(password, forKey: "Password")
            UserDefaults.standard.set(id, forKey: "UserID")
            goToDifferentView()
        }
        else{
            loginDone = false
            if error == "Unauthorized"{
                IncorrectCredentials.text = "Incorrect Credentials. Please try again"
            }
            else{
                IncorrectCredentials.text = error
            }
            
            IncorrectCredentials.isHidden = false
        }
       /*
        UserDefaults.standard.set(true, forKey: "LoggedIn")
        UserDefaults.standard.set(email, forKey: "Email")
        UserDefaults.standard.set(password, forKey: "Password")
        */
        //if the information is wrong, prompt the user to enter the correct information
        //IncorrectCredentials.isHidden = false
    }
    
    /*
     Function that will prepare the next screen
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
        if segue.identifier == ""{
           // let Ranking:Ranking = segue.destination as! Ranking
           // Ranking.days = days
        
        }
    }
    
    @objc func goToDifferentView(){
        self.performSegue(withIdentifier: "LoginSegue", sender: self)
    }
}

