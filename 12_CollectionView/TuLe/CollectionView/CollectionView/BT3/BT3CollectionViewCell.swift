import UIKit

final class BT3CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    func updateCell(value: String) {
        nameLabel.text = value
    }

}
