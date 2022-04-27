import UIKit

final class ContactDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var contactName: UILabel!
    
    // MARK: - Properties
    var contactname: String = ""
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactName.text = contactname
    }
}
