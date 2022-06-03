
import UIKit

// MARK: - MyViewDelegate
protocol MyViewDelegate: class {
    func view(view: MyView , needPerform action: MyView.Action )
}

final class MyView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var orangeView: UIView!
    @IBOutlet private weak var blueView: UIView!
    @IBOutlet private weak var redView: UIView!
    @IBOutlet private weak var valueLabel: UILabel!
    
    // MARK: - Properties
    weak var delegate: MyViewDelegate?
    var value: Int?
    
    // MARK: - Override functions
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
                
                let newBlueHeight = orangeView.frame.size.height + (orangeView.frame.origin.y - redView.center.y)
                blueView.frame = CGRect(x: blueView.bounds.origin.x,
                                        y: redView.center.y,
                                        width: blueView.bounds.size.width,
                                        height: newBlueHeight)
                let percent = (newBlueHeight / orangeView.bounds.height) * 100
                valueLabel.text = String(Int(percent))
                delegate?.view(view: self, needPerform: .sendData(value: String(Int(percent))))
            }
        }
    }
    
    // MARK: - Functions
    func updateView() {
        guard  let value = value else {
            return
        }
        valueLabel.text = "\(value)"
        let heightBlue = (Int(orangeView.bounds.height) * value) / 100
        let yNew = Int(orangeView.bounds.height) - heightBlue
        blueView.frame = CGRect(x: blueView.bounds.origin.x,
                                y: CGFloat(yNew) - orangeView.frame.origin.y,
                                width: blueView.bounds.size.width,
                                height: CGFloat(heightBlue))
        redView.center.y = CGFloat(yNew)
    }
}

// MARK: - Action
extension MyView {
    enum Action {
        case sendData(value: String)
    }
}
