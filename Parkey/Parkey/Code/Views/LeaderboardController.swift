import UIKit

class LeaderboardController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userRank: UILabel!
    
    var users: [User] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .secondaryLabel
        tableView.allowsSelection = false
        users = RequestHandler.getLeaderboard()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.name
        cell.textLabel?.font = UIFont(name:"Kohinoor Telugu", size: 20)
        cell.textLabel?.textColor = .white
        cell.detailTextLabel?.text = "#" + String(indexPath.row + 1) + " - Points: " + String(user.totalPoints)
        cell.detailTextLabel?.textColor = .white
        cell.detailTextLabel?.font = UIFont(name:"Kohinoor Telugu", size: 16)
        
        if(user.email == UserDefaults.standard.string(forKey: "Email"))
        {
            userRank.text = "Rank - #\(indexPath.row + 1)"
        }
        
        if(indexPath.row % 2 == 0)
        {
            cell.backgroundColor = UIColor(red: 3/255.0, green: 28/255.0, blue: 59/255.0, alpha: 1)
        }
        else
        {
            cell.backgroundColor = .secondaryLabel
        }
        
        return cell
    }
}
