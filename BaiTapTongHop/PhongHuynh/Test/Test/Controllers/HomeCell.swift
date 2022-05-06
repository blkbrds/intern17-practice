import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: - Private functions
    func updateTableCell(avatar: String, name: String, date: String) {
        userImageView.image = UIImage(named: avatar)
        nameLabel.text = name
        dateLabel.text = date
    }
    
    @IBAction private func nextButton(_ sender: Any) {
    }
    
}
