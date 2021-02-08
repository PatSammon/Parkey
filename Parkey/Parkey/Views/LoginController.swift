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

    @IBAction func testBtnPressed(_ sender: Any)
    {
        //grab the URL for the database (currently set to local)
        let url = URL(string: "http://127.0.0.1:8080/newUser")!
        //create the encoder that will be used
        let encoder = JSONEncoder()
        
        //make a POST request to the database so it is more secure
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let newUser = User(name: EmailLogin.text!, age: Int(PasswordLogin.text!)!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //try to encode the body with the user data
        request.httpBody = try? encoder.encode(newUser)
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data
            {
                
                let decoder = JSONDecoder()
                
                if let user = try? decoder.decode(User.self, from: data)
                {
                    print(user.name + " Added user to DB")
                }
            }
        }.resume()
        
        fetchData()
    }
    
    func fetchData()
    {
        let url = URL(string: "http://127.0.0.1:8080/users")!
        
        URLSession.shared.dataTask(with: url)
            {
            data, response, error in
            guard let data = data else
            {
                print(error?.localizedDescription ?? "Unknown Error")
                return
            }
            
            let decoder = JSONDecoder()
            
            if let users = try? decoder.decode([User].self, from: data)
            {
                DispatchQueue.main.sync { [self] in
                    self.users = users
                    self.showData()
                    
                }
            } else
            {
                print("Unable to parse JSON response.")
            }

        }.resume()

    }
    
    func showData()
    {
        for user in users
        {
            print(user.name)
            print(user.age)
        }
    }
    
    /*
     This is the function that will be run when the user is trying to login to the app.
     */
    @IBAction func Login(_ sender: Any) {
        //check the email exists within the database
        //check the password is the proper one for the email
        
        //if the information is correct, then use the segue to continue to the app
        
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

