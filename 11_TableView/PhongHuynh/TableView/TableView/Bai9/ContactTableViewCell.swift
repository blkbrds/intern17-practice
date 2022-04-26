import UIKit

// MARK: - ContactTableViewCellDelegate
protocol ContactTableViewCellDelegate: class {
    func makeCall(view: ContactTableViewCell)
}

class ContactTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var contactNamelabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var clickButton: UIButton!
    
    // MARK: - Properties
    var delegate: ContactTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarImageView.layer.cornerRadius = 10
        avatarImageView.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private functions
    func updateTableCell(avatar: String, contactName: String = "", subtitle: String = "", button: String) {
        avatarImageView.image = UIImage(named: avatar)
        contactNamelabel.text = contactName
        subtitleLabel.text = subtitle
        clickButton.setImage(UIImage(named: button), for: .normal)
    }
    
    // MARK: - IBActions
    @IBAction private func clickButton(_ sender: Any) {
        delegate?.makeCall(view: self)
    }
}
