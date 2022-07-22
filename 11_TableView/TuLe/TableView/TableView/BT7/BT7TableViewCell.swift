import UIKit

protocol BT7TableViewCellDelegate: AnyObject {
    func cell(cell: UITableViewCell, needPerform action: BT7TableViewCell.Action)
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
        tapButton.addTarget(self, action: #selector(tapButtonTouchUpInside(_:)), for: .touchUpInside)
    }
    
    func updateTableCell(name: String, avatar: String, index: Int) {
        titleLabel.text = name
        avatarImageView.image = UIImage(named: avatar)
        tapButton.tag = index
    }
    
    @objc private func tapButtonTouchUpInside(_ sender: UIButton) {
        delegate?.cell(cell: self, needPerform: .buttonTapped(data: sender.tag))
    }
    
}
