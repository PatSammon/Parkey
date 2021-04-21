//
//  SavedVehiclesController.swift
//  Parkey
//
//  Created by Laydon Owens on 3/27/21.
//  Copyright © 2021 iona. All rights reserved.
//

import UIKit

class SavedVehiclesController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var registeredVehicles = [Vehicle]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        registeredVehicles = RequestHandler.getVehicle()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return registeredVehicles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        
        let vehicle = registeredVehicles[indexPath.row]
        
        cell.textLabel?.text = vehicle.make + "" + vehicle.model + "" + String(vehicle.size)
        cell.textLabel?.font = UIFont(name:"Helvetica-Bold", size: 20)
        cell.textLabel?.textColor = .blue
        cell.detailTextLabel?.textColor = .black
        cell.detailTextLabel?.font = UIFont(name:"Helvetica", size: 16)
        cell.backgroundColor = UIColor(red: 31, green: 31, blue: 36, alpha: 1.0)
        cell.imageView?.image = UIImage(named: "car.png")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,  commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {

        let vehicles = registeredVehicles[indexPath.row]
        if  editingStyle == UITableViewCell.EditingStyle.delete
        {
            let alert = UIAlertController(title: "Delete Vehicle", message: "Are you sure you would like to delete this vehicle \(vehicles.make) \(vehicles.model)?", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
            }))
            
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action) in alert.dismiss(animated: true, completion: nil)
                print("No")
                
                
            }))
           
            RequestHandler.removeVehicle(vehicleID: vehicles.id!)
            
            //  tableView.deleteRows(at: [indexPath], with: .fade)
                       
                      
            self.registeredVehicles = RequestHandler.getVehicle()
                       
            tableView.reloadData()
                       
            
            self.present(alert, animated: true)
            
            
        }
        
    }
    
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
       
        performSegue(withIdentifier: "EditVehicleSegue", sender: indexPath);
    }
}


