
import UIKit

protocol MyViewDelegate: class {
    func view(view: MyView , needPerform action: MyView.Action )
}

class MyView: UIView {

    @IBOutlet private weak var orangeView: UIView!
    @IBOutlet private weak var blueView: UIView!
    @IBOutlet private weak var redView: UIView!
    @IBOutlet private weak var valueLabel: UILabel!
    
    weak var delegate: MyViewDelegate?
    var value: Int?

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
                valueLabel.text = String(Int(percent))
                delegate?.view(view: self, needPerform: .sendData(value: String(Int(percent))))
            }
        }
    }
    
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

extension MyView {
    enum Action {
        case sendData(value: String)
    }
}

//b1: tao action -> action lam -> kiu du lieu can truyen
//b1: tao protocol
