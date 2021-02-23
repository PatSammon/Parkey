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
        settings.append(Settings.init(sectionName: "App Settings", settingNames: ["Notifications", "Privacy Settings", "Log Out"]))
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
    
}
