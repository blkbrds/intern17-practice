import UIKit

final class Bai01CollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var numberLabel: UILabel!
    var number: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        numberLabel.text = number
    }
}
