//
//  CarProfile.swift
//  Parkey
//
//  Created by Laydon Owens on 3/4/21.
//  Copyright © 2021 iona. All rights reserved.
//

import UIKit

class CarProfile: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var registeredVehicle = [Vehicle]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        registeredVehicle = RequestHandler.getVehicle(userId: UserDefaults.standard.value(forKey: "UserID") as! String)
        
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return registeredVehicle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor(red: 0.93, green: 0.97, blue: 1.0, alpha: 1.0)
        cell.imageView?.image = UIImage(named: "car.png")
        
        let carDetail = registeredVehicle[indexPath.row]
        cell.textLabel?.text = "License Plate: " + carDetail.licensePlate + "Make: " + carDetail.make + "Model: " + carDetail.model
        
        return cell
        
    }
    
    func tablView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
}
