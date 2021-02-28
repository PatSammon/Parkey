import UIKit
import MaterialComponents.MaterialCards

class RewardsController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        var userRewards = [Reward]()
        
        userRewards = RequestHandler.getRewards(userId: UserDefaults.standard.value(forKey: "UserID") as! String)
    }
}
