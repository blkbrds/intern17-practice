import UIKit

class TeamHeaderReusableView: UICollectionReusableView {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var teamNameLabelLeadingConstraint: NSLayoutConstraint!
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = 30
        avatarImageView.clipsToBounds = true
    }
    
    func updateHeaderView(avatar: UIImage, name: String, status: Status) {
        avatarImageView.image = avatar
        nameLabel.text = name
        updateHeaderView(status: status)
    }
    
    func updateHeaderView(status: Status) {
        switch status {
        case .standard:
            avatarImageView.isHidden = false
            teamNameLabelLeadingConstraint.constant = 80
        case .small:
            avatarImageView.isHidden = true
            teamNameLabelLeadingConstraint.constant = 10
        }
    }
    
}
