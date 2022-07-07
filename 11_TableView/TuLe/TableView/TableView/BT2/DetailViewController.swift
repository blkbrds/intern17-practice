import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configUI() {
        title = "Detail"
        nameLabel.text = name
    }
}
