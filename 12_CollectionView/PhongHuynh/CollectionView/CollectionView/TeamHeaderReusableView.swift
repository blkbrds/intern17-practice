import UIKit

class TeamHeaderReusableView: UICollectionReusableView {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateHeaderView(avatar: UIImage, name: String) {
        avatarImageView.image = avatar
        nameLabel.text = name
    }
    
}
