import UIKit

class ContactDetailViewController: UIViewController {

    @IBOutlet weak var contactName: UILabel!
    
    var contactname: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactName.text = contactname

    }


   

}
