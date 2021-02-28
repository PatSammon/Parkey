import UIKit

class RewardsController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
   
    @IBOutlet weak var cardTableView: UITableView!
    
    var userRewards = [Reward]()
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        userRewards = RequestHandler.getRewards(userId: UserDefaults.standard.value(forKey: "UserID") as! String)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return userRewards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardCell
        
        let reward = userRewards[indexPath.row]
        
        cell.createCell(id: reward.id!, picture: UIImage(), title: reward.name, description: "This is a description for \(reward.name)", cost: reward.cost)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let reward = userRewards[indexPath.row]
        
        /*if availablePoints < reward.cost
        {
            let alert = UIAlertController(title: "Not enough points", message: "You currently don't have enough points to redeem this reward!", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            present(alert, animated: true, completion: nil)
        }*/
        
    }
    
}
