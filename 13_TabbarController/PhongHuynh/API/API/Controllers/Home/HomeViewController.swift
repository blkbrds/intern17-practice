import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    
    var viewmodel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        fetchData()
    }
    
    func updateUI() {
        
    }
    
    func fetchData() {
       
    }
}
