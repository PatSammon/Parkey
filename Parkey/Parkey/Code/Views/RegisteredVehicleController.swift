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
