import UIKit

final class TeamFooterReusableView: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var clickLabel: UILabel!
    @IBOutlet private weak var teamFooterLabelLeadingConstraint: NSLayoutConstraint!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Funtions
    func updateFooterView(click: String, status: Status) {
        clickLabel.text = click
        updateFooterView(status: status)
    }
    
    func updateFooterView(status: Status) {
        switch status {
        case .standard:
            clickLabel.isHidden = false
            teamFooterLabelLeadingConstraint.constant = 30
        case .small:
            clickLabel.isHidden = true
            teamFooterLabelLeadingConstraint.constant = 20
        }
    }
}
