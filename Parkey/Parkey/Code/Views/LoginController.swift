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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /*
     This is the function that will be run when the user is trying to login to the app.
     */
    @IBAction func Login(_ sender: Any) {
        //check the email exists within the database
        let email = EmailLogin.text
        //check the password is the proper one for the email
        let password = PasswordLogin.text
        
        //if the information is correct, then use the segue to continue to the app
        RequestHandler.sign_in(userName: email!, password: password!)
        
        UserDefaults.standard.set(true, forKey: "LoggedIn")
        UserDefaults.standard.set(email, forKey: "Email")
        UserDefaults.standard.set(password, forKey: "Password")
        
        //if the information is wrong, prompt the user to enter the correct information
        IncorrectCredentials.isHidden = false
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
}

