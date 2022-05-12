import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameImageView: UIImageView!
    
    var viewModel: HomeCellViewModel? {
        didSet { updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateView() {
        nameLabel.text = viewModel?.users.name
        Networking.shared().downloadImage(url: (viewModel?.users.avatar)!) { (image) in
            self.nameImageView.image = image
        }
    }
    
}
