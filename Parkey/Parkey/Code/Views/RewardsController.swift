import UIKit

class RewardsController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
   
    @IBOutlet weak var cardTableView: UITableView!
    
    var userRewards = [Reward]()
    var availablePoints = 0
    var emailNotif = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        userRewards = RequestHandler.getRewards(userId: UserDefaults.standard.value(forKey: "UserID") as! String)
        
        RequestHandler.getPoints(userName: UserDefaults.standard.string(forKey: "Email") ?? "", password: UserDefaults.standard.string(forKey: "Password") ?? "")
        { Result in
            
        switch Result
        {
        case .success(let response):
            
            self.availablePoints = response.1.availablePoints
            
        case .failure( _):
            print("failure")
         }
            
        }
        
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
        
        if availablePoints < reward.cost
        {
            let alert = UIAlertController(title: "Not enough points", message: "You currently don't have enough points to redeem this reward!", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            present(alert, animated: true, completion: nil)
        }
        else
        {
            let alert = UIAlertController(title: "Confirm reward", message: "Are you sure you would like to redeem \(reward.name)?", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
                
                RequestHandler.spendPoints(userName: UserDefaults.standard.string(forKey: "Email") ?? "", password: UserDefaults.standard.string(forKey: "Password") ?? "", points: reward.cost)
                { Result in }
                
                RequestHandler.removeReward(rewardId: reward.id!)
                
                self.userRewards = RequestHandler.getRewards(userId: UserDefaults.standard.value(forKey: "UserID") as! String)
                
                tableView.reloadData()
                
                let alert2 = UIAlertController(title: "Reward", message: "Check your e-mail for details on using your reward!", preferredStyle: UIAlertController.Style.alert)
                
                alert2.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                
                self.present(alert2, animated: true, completion: nil)
            
            }))
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            
            
            
            
            present(alert, animated: true, completion: nil)
        }
        
    }
}
