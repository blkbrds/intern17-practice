
import UIKit

class CustormSliderViewController: UIViewController {
    
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var ratioLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redView.layer.cornerRadius = 35
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == redView {
                let location = touch.location(in: orangeView)
                if location.y < orangeView.bounds.minY {
                    redView.center.y = orangeView.bounds.minY
                } else if location.y > orangeView.bounds.maxY {
                    redView.center.y = orangeView.bounds.maxY
                } else {
                    redView.center.y = location.y
                }
        
                let heightBlueNew = orangeView.frame.size.height + (orangeView.frame.origin.y - redView.center.y)
                blueView.frame = CGRect(x: blueView.bounds.origin.x,
                                        y: redView.center.y,
                                        width: blueView.bounds.size.width,
                                        height: heightBlueNew)
                let percent = (heightBlueNew / orangeView.bounds.height) * 100
                ratioLable.text = String(Int(percent))
            }
        }
    }
}
