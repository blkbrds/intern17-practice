import UIKit

final class CustomSliderViewController: UIViewController {
    @IBOutlet private weak var buttonSliderView: UIView!
    @IBOutlet private weak var blueView: UIView!
    @IBOutlet private weak var redView: UIView!
    @IBOutlet private weak var parentView: UIView!
    @IBOutlet private weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        valueLabel.text = "\(50)"
        buttonSliderView.layer.cornerRadius = 30
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == buttonSliderView {
                let location = touch.location(in: parentView)
                if location.y > parentView.bounds.maxY {
                    buttonSliderView.center.y = parentView.bounds.maxY
                } else if location.y < parentView.bounds.minY {
                    buttonSliderView.center.y = parentView.bounds.minY
                } else {
                    buttonSliderView.center.y = location.y
                }
                
                var newHeightBlueSlider: CGFloat {
                    return blueView.frame.size.height + (blueView.frame.origin.y - buttonSliderView.center.y)
                }
                
                var valueNow: CGFloat {
                    return (newHeightBlueSlider / redView.frame.size.height) * 100
                }
               
                blueView.frame = CGRect(x: blueView.frame.origin.x, y: buttonSliderView.center.y, width: blueView.frame.size.width, height: newHeightBlueSlider)
                valueLabel.text = "\(Int(valueNow))"
            }
        }
    }
}
