//
//  RegisterVehicleViewController.swift
//  Parkey
//
//  Created by Laydon Owens on 3/3/21.
//  Copyright © 2021 iona. All rights reserved.
//

import UIKit

class RegisterVehicleViewController: UIViewController//, UITableViewDelegate, UITableViewDataSource
{
    
    
    @IBOutlet weak var licensePlate: UITextField!
    
    @IBOutlet weak var color: UITextField!
    
    var editVehicle: Vehicle?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
    }
    /*
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        return
    }
    */

 
}