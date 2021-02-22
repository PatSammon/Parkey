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
        /*settingsList.register(SettingsCell.self, forCellReuseIdentifier: "reuseIdentifier")*/
        settings.append(Settings.init(sectionName: "App Settings", settingNames: ["Notifications", "Privacy Settings", "Log Out"]))
        settings.append(Settings.init(sectionName: "About Us", settingNames: ["Feedback", "About Us"]))
        settings.append(Settings.init(sectionName: "Share and Rate", settingNames: ["Invite Drivers", "Rate ParKey"]))
    }	
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        view.backgroundColor = .cyan
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: view.frame.width, height: 50))
        label.text = settings[section].sectionName
        label.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].settingNames?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        /*let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! SettingsCell*/
        cell.textLabel?.text = settings[indexPath.section].settingNames?[indexPath.row]
        return cell
    }
    
}
