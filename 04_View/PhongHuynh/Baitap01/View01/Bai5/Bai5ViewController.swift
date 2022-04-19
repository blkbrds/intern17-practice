import UIKit

final class Bai5ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak private var phantramLabel: UILabel!
    @IBOutlet weak private var whiteView: UIView!
    @IBOutlet weak private var blueView: UIView!
    @IBOutlet weak private var greenView: UIView!
    @IBOutlet weak private var parentView: UIView!
    
    // MARK: - Life cycle
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
