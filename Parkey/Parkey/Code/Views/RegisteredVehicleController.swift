//
//  RegisteredVehicleController.swift
//  Parkey
//
//  Created by Laydon Owens on 3/27/21.
//  Copyright © 2021 iona. All rights reserved.
//

import UIKit

class RegisteredVehicleController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var licensePlate: UITextField!
    @IBOutlet weak var make: UITextField!
    @IBOutlet weak var model: UITextField!
    @IBOutlet weak var size: UITextField!
    @IBOutlet weak var ErrorMessage: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupErrorMessage()

    }
    
    @IBAction func saveCarInfo(_ sender: Any)
    {
        if licensePlate.text == nil ||  make.text == nil || model.text == nil || size.text == nil
        {
            ErrorMessage.text = "Must fill in all fields"
            ErrorMessage.isHidden=false
            return
        }
        
        RequestHandler.addVehicle(userId: UserDefaults.standard.value(forKey: "UserID") as! String, licensePlate: licensePlate.text!, make: make.text!, model: model.text!, size: Int(size.text!) ?? 0)
       
       
        
        
        if !ErrorMessage.isHidden
        {
            ErrorMessage.isHidden=true
        }
        
        licensePlate.text?.removeAll()
        make.text?.removeAll()
        model.text?.removeAll()
        size.text?.removeAll()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
            textField.layer.borderColor = .init(srgbRed: 0.93, green: 0.97, blue: 1.0, alpha: 1.0)
            ErrorMessage.isHidden = true
    }
    
    func setupErrorMessage()
    {

            ErrorMessage.isHidden = true
           
    }
    
}
