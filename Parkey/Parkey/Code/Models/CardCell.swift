import UIKit

class CardCell: UITableViewCell
{
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    var id = ""

    func createCell(id: String, picture: UIImage, title: String, description: String, cost: Int)
    {
        pictureView.image = picture
        titleLabel.text = title
        descriptionLabel.text = description
        costLabel.text = String(cost)
        self.id = id
        
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        cardView.layer.shadowOpacity = 1.0
        cardView.layer.masksToBounds = false
        cardView.layer.cornerRadius = 4.0
        
    }
}
