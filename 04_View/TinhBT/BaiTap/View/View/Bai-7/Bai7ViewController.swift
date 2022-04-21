
import UIKit

class Bai7ViewController: UIViewController {
    
    @IBOutlet weak var viewTap: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(Bai7ViewController.handleSingleTap(recognizer:)))
        singleTap.numberOfTapsRequired = 1
        viewTap.addGestureRecognizer(singleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(Bai7ViewController.handleDoubleTap(recognizer:)))
        doubleTap.numberOfTapsRequired = 2
        viewTap.addGestureRecognizer(doubleTap)
        
        singleTap.require(toFail: doubleTap)
        viewTap.isUserInteractionEnabled = true
    }
    
    @objc func handleSingleTap(recognizer: UITapGestureRecognizer) {
        guard recognizer.view != nil else { return }
        messageLabel.isHidden = false
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            UIView.animate(withDuration: 5.0) {
                self.messageLabel.alpha = 0
            }
        }
    }
    
    @objc func handleDoubleTap(recognizer: UITapGestureRecognizer) {
        guard recognizer.view != nil else { return }
        messageLabel.isHidden = false
        messageLabel.text = "khi la toi"
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            UIView.animate(withDuration: 5.0) {
                self.messageLabel.alpha = 0
            }
        }
    }
}

