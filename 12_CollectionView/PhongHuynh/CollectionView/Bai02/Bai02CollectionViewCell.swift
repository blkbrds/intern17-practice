import UIKit

final class Bai02CollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var blueLabel: UILabel!
    
    // MARK: - Properties
    var name: String = ""
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        blueLabel.text = name
    }
}
