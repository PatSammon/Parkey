//
//  SettingsCell.swift
//  Parkey
//
//  Created by user188405 on 2/22/21.
//  Copyright © 2021 iona. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    lazy var switchControl: UISwitch = {
        let switchControl = UISwitch()
        switchControl.isOn = true
        switchControl.isHidden = true
        switchControl.onTintColor = UIColor(red: 190/255, green: 60/255, blue: 40/255, alpha: 1)
        return switchControl
    }()

}
