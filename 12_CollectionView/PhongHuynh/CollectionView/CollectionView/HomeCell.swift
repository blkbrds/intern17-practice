import UIKit

class HomeCell: UICollectionViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(avatar: UIImage, name: String) {
        avatarImageView.image = avatar
        nameLabel.text = name
    }

}
