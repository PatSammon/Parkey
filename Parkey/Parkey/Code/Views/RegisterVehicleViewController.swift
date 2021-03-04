//
//  RegisterVehicleViewController.swift
//  Parkey
//
//  Created by Laydon Owens on 3/3/21.
//  Copyright © 2021 iona. All rights reserved.
//

import UIKit

class RegisterVehicleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    var registeredVehicle = [Vehicle]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        registeredVehicle = RequestHandler.getVehicle(userId: UserDefaults.standard.value(forKey: "UserID") as! String)
        
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return registeredVehicle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
    }
    
    func tablView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
    

 
}
