import UIKit

class RegisteredVehicleController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var licensePlate: UITextField!
    @IBOutlet weak var make: UITextField!
    @IBOutlet weak var model: UITextField!
    @IBOutlet weak var size: UITextField!
    @IBOutlet weak var ErrorMessage: UILabel!
    
    var Editing = false
    var Vehicle:Vehicle?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupErrorMessage()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        licensePlate.layer.masksToBounds = true
        licensePlate.layer.borderColor = UIColor.black.cgColor
        licensePlate.layer.borderWidth = 1.0
        make.layer.masksToBounds = true
        make.layer.borderColor = UIColor.black.cgColor
        make.layer.borderWidth = 1.0
        model.layer.masksToBounds = true
        model.layer.borderColor = UIColor.black.cgColor
        model.layer.borderWidth = 1.0
        size.layer.masksToBounds = true	
        size.layer.borderColor = UIColor.black.cgColor
        size.layer.borderWidth = 1.0
        licensePlate.attributedPlaceholder =
            NSAttributedString(string: "License Plate", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        make.attributedPlaceholder =
            NSAttributedString(string: "Make", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        model.attributedPlaceholder =
            NSAttributedString(string: "Model", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        size.attributedPlaceholder =
            NSAttributedString(string: "Size", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        //check if it is editing
        if isEditing{
            //fill in the values of the attributes
            licensePlate.text=Vehicle?.licensePlate
            make.text=Vehicle?.make
            model.text=Vehicle?.model
            size.text = String(Vehicle?.size ?? 0)
            
            //hide the licenseplate text
            licensePlate.isHidden = true
        }
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func saveCarInfo(_ sender: Any)
    {
        if licensePlate.text == nil ||  make.text == nil || model.text == nil || size.text == nil
        {
            ErrorMessage.text = "Must fill in all fields"
            ErrorMessage.isHidden=false
            return
        }
        
        if !isEditing{
        RequestHandler.addVehicle(userId: UserDefaults.standard.value(forKey: "UserID") as! String, licensePlate: licensePlate.text!, make: make.text!, model: model.text!, size: Int(size.text!) ?? 0)
        }
        else{
            //make the request to update the vehicle
            
            //update the fields
            Vehicle?.licensePlate=licensePlate.text!
            Vehicle?.make=make.text!
            Vehicle?.model=model.text!
            Vehicle?.size=Int(size.text!) ?? 0
            
            //call request handler
            RequestHandler.updateVehicle(vehicle: Vehicle!)
        }
        navigationController?.popViewController(animated: true)
        //performSegue(withIdentifier: "new2Home", sender: self)
        
        /*if let navController =  self.navigationController
        {
            navController.popViewController(animated: true)
        }*/
        
       
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
