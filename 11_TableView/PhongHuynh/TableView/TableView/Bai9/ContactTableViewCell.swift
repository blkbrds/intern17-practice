import UIKit

protocol ContactTableViewCellDelegate: class {
    func makeCall(view: ContactTableViewCell)
}

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var contactNamelabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var clickButton: UIButton!
    
    var delegate: ContactTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = 10
        avatarImageView.clipsToBounds = true
        
        let callButton = UIButton(frame: CGRect(x: 300, y: 0, width: 50, height: 100))
        callButton.setImage(UIImage(named: "imgName.png"), for: .normal)
        callButton.addTarget(self, action: #selector(makeCall), for: .touchUpInside)
        addSubview(callButton)

        
    }
    
    @objc func makeCall() {
        delegate?.makeCall(view: self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    func updateTableCell(avatar: String, contactName: String = "", subtitle: String = "", button: String) {
        avatarImageView.image = UIImage(named: avatar)
        contactNamelabel.text = contactName
        subtitleLabel.text = subtitle
        
    }
    
   
    
}
