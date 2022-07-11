import UIKit

final class HeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet private weak var headerSeasonLabel: UILabel!
    
    func updateHeader(name: String) {
        headerSeasonLabel.text = name
    }
    
}
