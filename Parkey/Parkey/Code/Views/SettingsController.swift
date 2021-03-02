//
//  SettingsController.swift
//  Parkey
//
//  Created by user188405 on 2/14/21.
//  Copyright © 2021 iona. All rights reserved.
//
import UIKit

protocol SectionType: CustomStringConvertible {
    var hasSwitch: Bool { get }
}

enum Sections: Int, CaseIterable, CustomStringConvertible {
    case AppSettings = 0
    case AboutUs = 1
    case ShareAndRate = 2
    
    var description: String {
        switch self {
        case .AppSettings: return "App Settings"
        case .AboutUs: return "About Us"
        case .ShareAndRate: return "Share and Rate"
        }
    }
}

enum AppSettingsSection: Int, CaseIterable, SectionType {
    case Notifications = 0
    case PrivacySettings = 1
    case LogOut = 2
    
    var hasSwitch: Bool {
        switch self {
        case .Notifications:
            return true
        case .PrivacySettings:
            return false
        case .LogOut:
            return false
        }
    }
    
    var description: String {
        switch self {
        case .Notifications: return "Notifications"
        case .PrivacySettings: return "Privacy Settings"
        case .LogOut: return "Log Out"
        }
    }
}

enum AboutUsSection: Int, CaseIterable, SectionType {
    case Feedback = 0
    case AboutUs = 1
    
    var hasSwitch: Bool { return false}
    
    var description: String {
        switch self {
        case .Feedback: return "Feedback"
        case .AboutUs: return "About Us"
        }
    }
}

enum ShareRateSection: Int, CaseIterable, SectionType {
    case InviteDrivers = 0
    case RateParKey = 1
    
    var hasSwitch: Bool { return false}
    
    var description: String {
        switch self {
        case .InviteDrivers: return "Invite Drivers"
        case .RateParKey: return "Rate ParKey"
        }
    }
}


class SettingsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    
    @IBOutlet weak var settingsList: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUp()
        
    }
    
    func loadUp() {
        settingsList.dataSource = self
        settingsList.delegate = self
<<<<<<< Updated upstream
        /*settingsList.register(SettingsCell.self, forCellReuseIdentifier: "reuseIdentifier")*/
        settings.append(Settings.init(sectionName: "App Settings", settingNames: ["Notifications", "Privacy Settings", "Log Out"]))
        settings.append(Settings.init(sectionName: "About Us", settingNames: ["Feedback", "About Us"]))
        settings.append(Settings.init(sectionName: "Share and Rate", settingNames: ["Invite Drivers", "Rate ParKey"]))
    }	
=======
        settingsList.register(SettingsCell.self, forCellReuseIdentifier: "reuseIdentifier")
        settingsList.rowHeight = 60
        settingsList.frame = view.frame
        
    }
>>>>>>> Stashed changes
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        view.backgroundColor = .cyan
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: view.frame.width, height: 50))
<<<<<<< Updated upstream
        label.text = settings[section].sectionName
=======
        label.text = Sections.init(rawValue: section)?.description
>>>>>>> Stashed changes
        label.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let section = Sections(rawValue: section) else { return 0}
        
        switch section {
        case .AppSettings: return AppSettingsSection.allCases.count
        case .AboutUs: return AboutUsSection.allCases.count
        case .ShareAndRate: return ShareRateSection.allCases.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
<<<<<<< Updated upstream
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        /*let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! SettingsCell*/
        cell.textLabel?.text = settings[indexPath.section].settingNames?[indexPath.row]
=======
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! SettingsCell
        guard let section = Sections(rawValue: indexPath.section) else { return UITableViewCell()}
        
        switch section {
        case .AppSettings:
            let appSettings = AppSettingsSection(rawValue: indexPath.row)
            cell.sectionType = appSettings
        case .AboutUs:
            let aboutUs = AboutUsSection(rawValue: indexPath.row)
            cell.sectionType = aboutUs
        case .ShareAndRate:
            let shareAndRate = ShareRateSection(rawValue: indexPath.row)
            cell.sectionType = shareAndRate
        }
        
>>>>>>> Stashed changes
        return cell
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = Sections(rawValue: indexPath.section) else { return }
        
        switch section {
        case .AppSettings:
            
        case .AboutUs:
            
        case .ShareAndRate:
            
        }
        
        
    }*/
}
