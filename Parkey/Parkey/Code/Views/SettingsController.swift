//
//  SettingsController.swift
//  Parkey
//
//  Created by user188405 on 2/14/21.
//  Copyright © 2021 iona. All rights reserved.
//

import UIKit

class Settings {
    var sectionName: String?
    var settingNames: [String]?
    
    init(sectionName: String, settingNames: [String]) {
        self.sectionName = sectionName
        self.settingNames = settingNames
    }
}

class SettingsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var settingsList: UITableView!
    

    var settings = [Settings]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsList.dataSource = self
        settingsList.delegate = self
        settings.append(Settings.init(sectionName: "App Settings", settingNames: ["Notifications", "Privacy Settings", "Rewards", "Log Out"]))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].settingNames?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = settings[indexPath.section].settingNames?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cellName = tableView.cellForRow(at: indexPath)?.textLabel!.text
        
        if(cellName! == "Rewards")
        {
            performSegue(withIdentifier: "Rewards", sender: indexPath)
        }

        if (cellName! == "Log Out"){
            LogOut()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?)
    {
        
    }
    
    //method that will be used to log the user out of the app
    func LogOut(){
        //remove the user default values
        UserDefaults.standard.removeObject(forKey: "LoggedIn")
        UserDefaults.standard.removeObject(forKey: "Email")
        UserDefaults.standard.removeObject(forKey: "Password")
        UserDefaults.standard.removeObject(forKey: "UserID")
    
        //now preform the segue to the initial screen
        self.performSegue(withIdentifier: "LogOut", sender: self)
    }
}
