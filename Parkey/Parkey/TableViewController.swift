//
//  TableViewController.swift
//  Parkey
//
//  Created by Laydon Owens on 2/15/21.
//  Copyright © 2021 iona. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var TableView: UITableView!
    
    var vehicle: [RegisteredVehicle] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        TableView.dataSource = self
        TableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        getData()
        TableView.reloadData()
    }
    
    func getData()
    {
        let dlgt =  UIApplication.shared.delegate as! AppDelegate
        let context = dlgt.persistentContainer.viewContext
        do
        {
            vehicle = try context.fetch(RegisteredVehicle.fetchRequest())
        }
        
        catch
        {
            print("Could not load data from the database...")
        }
    }
    
    func tableView(_ TableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        vehicle.count

    }
    
    func tableView(_ TableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor(red: 0.93, green: 0.97, blue: 1.0, alpha: 1.0)
        cell.imageView?.image = UIImage(named: "car.png")
       
        let carDetail = vehicle[indexPath.row]
        cell.textLabel?.text = "License Plate: " + carDetail.licensePlate! + "Make/Model: " + carDetail.makeModel! + "Color: " + carDetail.color!
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ TableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath )
    {
        let dlgt =  UIApplication.shared.delegate as! AppDelegate
        let context = dlgt.persistentContainer.viewContext
        
        if  editingStyle == .delete
        {
            
            let car = vehicle[indexPath.row]
            context.delete(car)
            dlgt.saveContext()
            
            do
            {
                vehicle = try context.fetch(RegisteredVehicle.fetchRequest())
            }
            
            catch
            {
                print("Could not load data from the database...")
            }
            
            TableView.reloadData()
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "editCarSegue"
        {
            let indexPath: NSIndexPath = sender as! NSIndexPath
            let car = vehicle[indexPath.row]
            
            let editViewCtrl: ViewController = segue.destination as! ViewController  // creates reference to this class
            editViewCtrl.editCar = car
        }
    }
    
    func tableView(_ TableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    
        performSegue(withIdentifier: "editCarSegue", sender: self);
    }
    

}
