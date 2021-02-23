//
//  ViewController.swift
//  Parkey
//
//  Created by Patrick Sammon on 2/3/21.
//  Copyright © 2021 iona. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var licensePlate: UITextField!
    @IBOutlet weak var MakeModel: UITextField!
    var editCar: RegisteredVehicle?
    @IBOutlet weak var color: UITextField!
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        
        if editCar != nil
        {
            licensePlate.text = editCar!.licensePlate
            color.text = editCar!.color
            MakeModel.text = editCar!.makeModel
        }
        
        else
        {
            licensePlate.text = " "
            color.text = " "
            MakeModel.text = " "
        }
        
    }
  
    
    @IBAction func saveData(_ sender: UIButton)
    {
        if (CheckData())
        {
            let dlgt = UIApplication.shared.delegate as! AppDelegate
            if (editCar == nil)
            {
                let vcontext = dlgt.persistentContainer.viewContext
                editCar = RegisteredVehicle(context: vcontext)
            }
            editCar?.licensePlate = licensePlate.text
            editCar?.color = color.text
            editCar?.makeModel = MakeModel.text
            dlgt.saveContext()
            navigationController!.popViewController(animated: true)
        }
        
        else
        {
            print("Incomplete information entered. Cannot create database entry.")
        }
        
    }
    
    func CheckData() -> Bool
    {
        if ((licensePlate.text != nil && licensePlate.text != "") && (color.text != nil && color.text != "") && (MakeModel.text != nil && MakeModel.text != ""))
        {
            return true
        }
        
        else
        {
            return false
        }
    }
    
    @IBAction func GoPressed(_ sender: Any)
    {
        performSegue(withIdentifier: "editCarSegue", sender: self)
    }

}

