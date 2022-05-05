import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var apiImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateCell(name: String, avatar: String) {
        nameLabel.text = name
        apiImageView.image = UIImage(named: avatar)
    }
    
}
