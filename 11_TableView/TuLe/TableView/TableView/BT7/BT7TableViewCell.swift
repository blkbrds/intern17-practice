import UIKit

protocol BT7TableViewCellDelegate: AnyObject {
    func view(vc: UITableViewCell, needPerform action: BT7TableViewCell.Action)
}

final class BT7TableViewCell: UITableViewCell {
    
    enum Action {
        case buttonTapped(data: Int)
    }
    
    @IBOutlet private weak var tapButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var selectIndex: Int?
    weak var delegate: BT7TableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateTableCell(name: String, avatar: String, index: Int) {
        titleLabel.text = name
        avatarImageView.image = UIImage(named: avatar)
        tapButton.tag = index
        tapButton.addTarget(self, action: #selector(tapButtonTouchUpInside(_:)), for: .touchUpInside)
    }
    
    @objc private func tapButtonTouchUpInside(_ sender: UIButton) {
        delegate?.view(vc: self, needPerform: .buttonTapped(data: sender.tag))
    }
    
}
