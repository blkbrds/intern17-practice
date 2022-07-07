import UIKit

final class BT11TableViewCell: UITableViewCell {
    
    @IBOutlet private weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateTableCell(content: String) {
        contentLabel.text = content
    }
    
}
