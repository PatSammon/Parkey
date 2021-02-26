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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func test(_ sender: Any) {
        RequestHandler.addPoints(userName: UserDefaults.standard.string(forKey: "Email") ?? "", password: UserDefaults.standard.string(forKey: "Password") ?? "") { Result in
        switch Result{
        case .success(let response):
            //make the call to go to home
            if response.1!.keys.contains("reason"){
                //todo make the error message pop up
                print(response.1!["reason"] as! String)
            }
            else{
                print("success")
            }
        case .failure(let error):
            print("failure")
        }
    }
    }

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
