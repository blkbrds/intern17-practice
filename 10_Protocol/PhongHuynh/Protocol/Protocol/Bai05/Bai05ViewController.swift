import UIKit

class Bai05ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    @IBAction func push(_ sender: Any) {
        guard let navi = navigationController else {
            return
        }
        let vc = SelectViewController()
        navi.pushViewController(vc, animated: true)
    }
    
}
