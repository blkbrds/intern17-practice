import UIKit

final class Bai01CollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var numberLabel: UILabel!
    
    // MARK: - Properties
    var number: String?
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        numberLabel.text = number
    }
}
