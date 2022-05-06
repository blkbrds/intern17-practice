
import UIKit

class Bai10ViewController: UIViewController {
    
    @IBOutlet weak var widthViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthSecondViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthRedViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthBlueViewConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapGreenButtonTouchUpInside(_ sender: Any) {
        widthViewConstraint.constant = 296
        widthSecondViewConstraint.constant = 148
        widthRedViewConstraint.constant = 148
        widthBlueViewConstraint.constant = 148
    }
    
    @IBAction func tapOrangeButtonTouchUpInside(_ sender: Any) {
        widthViewConstraint.constant = 148
        widthSecondViewConstraint.constant = 296
        widthRedViewConstraint.constant = 148
        widthBlueViewConstraint.constant = 148
        
    }
    
    @IBAction func tapRedButtonTouchUpInside(_ sender: Any) {
        widthViewConstraint.constant = 148
        widthSecondViewConstraint.constant = 148
        widthRedViewConstraint.constant = 296
        widthBlueViewConstraint.constant = 148
    }
    
    @IBAction func tapBluebuttonTouchUpInside(_ sender: Any) {
        widthViewConstraint.constant = 148
        widthSecondViewConstraint.constant = 148
        widthRedViewConstraint.constant = 148
        widthBlueViewConstraint.constant = 296
    }
}
