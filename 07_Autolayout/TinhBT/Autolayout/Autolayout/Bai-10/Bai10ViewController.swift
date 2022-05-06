
import UIKit

final class Bai10ViewController: UIViewController {
    
    @IBOutlet private weak var widthViewConstraint: NSLayoutConstraint!
    @IBOutlet private weak var widthSecondViewConstraint: NSLayoutConstraint!
    @IBOutlet private weak var widthRedViewConstraint: NSLayoutConstraint!
    @IBOutlet private weak var widthBlueViewConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func tapGreenButtonTouchUpInside(_ sender: Any) {
        widthViewConstraint.constant = 296
        widthSecondViewConstraint.constant = 148
        widthRedViewConstraint.constant = 148
        widthBlueViewConstraint.constant = 148
    }
    
    @IBAction private func tapOrangeButtonTouchUpInside(_ sender: Any) {
        widthViewConstraint.constant = 148
        widthSecondViewConstraint.constant = 296
        widthRedViewConstraint.constant = 148
        widthBlueViewConstraint.constant = 148
        
    }
    
    @IBAction private func tapRedButtonTouchUpInside(_ sender: Any) {
        widthViewConstraint.constant = 148
        widthSecondViewConstraint.constant = 148
        widthRedViewConstraint.constant = 296
        widthBlueViewConstraint.constant = 148
    }
    
    @IBAction private func tapBluebuttonTouchUpInside(_ sender: Any) {
        widthViewConstraint.constant = 148
        widthSecondViewConstraint.constant = 148
        widthRedViewConstraint.constant = 148
        widthBlueViewConstraint.constant = 296
    }
}
