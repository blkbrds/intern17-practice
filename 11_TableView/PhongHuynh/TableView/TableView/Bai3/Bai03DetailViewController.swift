import UIKit

final class Bai03DetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var detailLabel: UILabel!
    
    // MARK: - Properties
    var name: String = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DETAIL"
        detailLabel.text = name
    }
}
