import UIKit

class SavedVehiclesController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var tableView: UITableView!
    
    var userVehicles = [Vehicle]()
    var vehicleIndex=0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        userVehicles = RequestHandler.getVehicles(userId: UserDefaults.standard.value(forKey: "UserID") as! String)

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return userVehicles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        
        let vehicle = userVehicles[indexPath.row]
        
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
        let vehicle = userVehicles[indexPath.row]
        
        if  editingStyle == UITableViewCell.EditingStyle.delete
        {
            tableView.deleteRows(at: [indexPath], with: .fade)
            RequestHandler.removeVehicle(vehicleId: vehicle.id!)
            self.userVehicles = RequestHandler.getVehicles(userId: UserDefaults.standard.value(forKey: "UserID") as! String)
            tableView.reloadData()
        }
        
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        vehicleIndex=indexPath.row
        performSegue(withIdentifier: "EditVehicleSegue", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
        if segue.identifier == "EditVehicleSegue"{
            let RegisteredVehicleController:RegisteredVehicleController = segue.destination as! RegisteredVehicleController
            RegisteredVehicleController.isEditing = true
            RegisteredVehicleController.Vehicle=userVehicles[vehicleIndex]
        }
    }
}


