import UIKit

final class BT11TableViewCell: UITableViewCell {
    
    @IBOutlet private weak var contentLabel: UILabel!
    
    func updateTableCell(content: String) {
        contentLabel.text = content
    }
    
}
