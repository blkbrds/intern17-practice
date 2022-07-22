import UIKit

final class BT1CollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .blue
        valueLabel.textColor = UIColor.white
    }
    
    func updateCell(value: String) {
        valueLabel.text = value
    }

}
