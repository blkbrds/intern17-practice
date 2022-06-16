import UIKit

protocol MySliderViewDelegate: AnyObject {
    func valueNow(view: MySliderView, value: Int)
}

final class MySliderView: UIView {
    @IBOutlet private weak var parentView: UIView!
    @IBOutlet private weak var redView: UIView!
    @IBOutlet private weak var whiteView: UIView!
    @IBOutlet private weak var buttonSliderView: UIView!
    var delegate: MySliderViewDelegate?
    @IBOutlet private weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
    }
    
    private func configUI() {
        buttonSliderView.layer.cornerRadius = 20
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == buttonSliderView {
                
                guard let delegate = delegate else {
                    return
                }
                
                let location = touch.location(in: parentView)
                if location.y > parentView.bounds.maxY {
                    buttonSliderView.center.y = parentView.bounds.maxY
                } else if location.y < parentView.bounds.minY {
                    buttonSliderView.center.y = parentView.bounds.minY
                } else {
                    buttonSliderView.center.y = location.y
                }
                
                var newHeightBlueSlider: CGFloat {
                    return whiteView.frame.size.height + (whiteView.frame.origin.y - buttonSliderView.center.y)
                }
                
                var valueNow: CGFloat {
                    return (newHeightBlueSlider / redView.frame.size.height) * 100
                }
                
                whiteView.frame = CGRect(x: whiteView.frame.origin.x, y: buttonSliderView.center.y, width: whiteView.frame.size.width, height: newHeightBlueSlider)
                valueLabel.text = "\(Int(valueNow))"
                delegate.valueNow(view: self, value: Int(valueNow))
            }
        }
    }
}
