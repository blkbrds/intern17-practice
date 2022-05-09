import UIKit

// MARK: - HomeCellDelegate
protocol HomeCellDelegate: class {
    
    func cell(cell: HomeCell, needsPerfom actions: HomeCell.Action)
}

final class HomeCell: UITableViewCell {
    
    // MARK: - Define
    enum Action {
        case moveToDetail
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var nextButton: UIButton!
    
    // MARK: - Properties
    var viewModel: HomeCellViewModel? {
        didSet {
            updateView()
            boderButton()
        }
    }
    weak var delegate: HomeCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Private funtions
    private func updateView() {
        guard let viewModel = viewModel else { return }
        nameLabel.text = viewModel.user.name
        dateLabel.text = viewModel.user.date
    }
    
    private func boderButton() {
        userImageView.layer.cornerRadius = 40
        userImageView.layer.borderWidth = 0.5
        userImageView.layer.borderColor = UIColor.systemPink.cgColor
    }
    
    // MARK: - IBActions
    @IBAction private func nextButton(_ sender: Any) {
        if let delegate = delegate {
            delegate.cell(cell: self, needsPerfom: .moveToDetail)
        }
    }
}
