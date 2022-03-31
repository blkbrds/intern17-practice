import UIKit

class Bai5ViewController: UIViewController {
    
    @IBOutlet weak var phantramLabel: UILabel!
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var parentView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greenView.layer.cornerRadius = 40
    }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            if let touch = touches.first {
                if touch.view == greenView {
                    let location = touch.location(in: parentView)
                    
                    if location.y < parentView.bounds.minY {
                        greenView.center.y = parentView.bounds.minY
                    } else if location.y > parentView.bounds.maxY {
                        greenView.center.y = parentView.bounds.maxY
                    } else {
                        greenView.center.y = location.y
                    }
                    
                    let oldBlueViewHeight = blueView.frame.size.height
                    let oldBlueViewY = blueView.frame.origin.y
                    let newBlueHeight = oldBlueViewHeight + (oldBlueViewY - greenView.center.y)
                    blueView.frame = CGRect(x: blueView.frame.origin.x, y: greenView.center.y, width: blueView.frame.size.width, height: newBlueHeight)
                    let percent = blueView.frame.size.height / parentView.frame.size.height * 100
                    phantramLabel.text = "\(Int(percent))"
                }
            }
        }

}
