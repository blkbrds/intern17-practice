import UIKit

class HomeCell: UICollectionViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = true
        avatarImageView.layer.cornerRadius = 65
        avatarImageView.clipsToBounds = true
    }
    
    func updateCell(avatar: UIImage, name: String, status: Status) {
        avatarImageView.image = avatar
        nameLabel.text = name
        updateCell(status: status)
    }
    
    func updateCell(status: Status) {
        switch status {
        case .standard:
            avatarImageView.layer.cornerRadius = 65
        case .small:
            avatarImageView.layer.cornerRadius = 30
        }
    }

}
