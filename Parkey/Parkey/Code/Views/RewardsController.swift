import UIKit

class RewardsController: UIViewController
{
    var userRewards: [Reward] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
      userRewards = RequestHandler.getRewards(userId: "60386164669587e55cb2ec9c")
      print(userRewards[0].name)
    }
}
