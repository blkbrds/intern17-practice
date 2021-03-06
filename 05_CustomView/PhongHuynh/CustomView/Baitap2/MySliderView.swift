import UIKit

// MARK: - MySliderDelegate
protocol MySliderDelegate: class {
    
    func controller(view: MySliderView, needsPerfom actions: MySliderView.Action)
}

final class MySliderView: UIView {
    
    // MARK: Properties
    var value: Int = 50 {
        didSet {
            updateSlider()
        }
    }
    // MARK: - Define
    enum Action {
        case tap(value: String)
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var parentView: UIView!
    @IBOutlet private weak var blueView: UIView!
    @IBOutlet private weak var blackView: UIView!
    @IBOutlet private weak var greenView: UIView!
    @IBOutlet private weak var phantramLabel: UILabel!

    weak var delegate: MySliderDelegate?

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: parentView)
            if location.y < parentView.bounds.minY {
                greenView.center.y = parentView.bounds.minY
            } else if location.y > parentView.bounds.maxY {
                greenView.center.y = parentView.bounds.maxY
            } else {
                greenView.center.y = location.y
            }
            let oldBlackViewHeight = blackView.frame.size.height
            let oldBlackViewY = blackView.frame.origin.y
            let newBlackHeight = oldBlackViewHeight + (oldBlackViewY - greenView.center.y)
            blackView.frame = CGRect(x: blackView.frame.origin.x, y: greenView.center.y, width: blackView.frame.size.width, height: newBlackHeight)
            let percent = blackView.frame.size.height / parentView.frame.size.height * 100
            phantramLabel.text = "\(Int(percent))"
            if let delegate = delegate {
                delegate.controller(view: self, needsPerfom: .tap(value: "\(Int(percent))"))
            }
        }
    }
    
    // MARK: - Private functions
    private func updateSlider() {
        let yblackView = (CGFloat(100 - value) * (parentView.frame.maxY - 26) / 100)
        let heightView = CGFloat(value) * parentView.frame.size.height / 100
        blackView.frame = CGRect(x: blueView.frame.origin.x, y: yblackView, width: blueView.frame.size.width, height: heightView)
        greenView.center.y = yblackView
        let percent = blackView.frame.size.height / parentView.frame.size.height * 100
        phantramLabel.text = "\(Int(percent))"
    }
}
