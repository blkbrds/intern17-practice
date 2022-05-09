//
//  MySliderView.swift
//  ExecirseCustomView
//
//  Created by thuan.nguyen on 25/04/2022.
//

import UIKit
protocol MysliderViewDelegate {
    func sliderView(view: MySliderView, needsPerform action: MySliderView.Action)
}

class MySliderView: UIView {

    @IBOutlet weak var whiteView: UIView!
    
    @IBOutlet weak var blueView: UIView!
    
    @IBOutlet weak var circleView: UIView!
    
    @IBOutlet weak var label: UILabel!
    
    var delegate: MysliderViewDelegate?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        let touch = touches.first
        let location = touch?.location(in: whiteView)
        guard let location = location else { return }
                
        circleView.frame.origin.y = location.y
        if location.y > whiteView.bounds.maxY {
            circleView.center.y = whiteView.bounds.maxY
        } else if location.y < whiteView.bounds.minY {
            circleView.center.y = whiteView.bounds.minY
        } else {
            circleView.center.y = location.y
        }
                
        blueView.frame = CGRect(x: blueView.frame.origin.x, y: circleView.center.y, width: blueView.frame.width, height: whiteView.frame.height - circleView.center.y)
        
        let rs = Int((blueView.frame.height / whiteView.frame.height) * 100)
        label.text = "\(rs)"
    
        delegate?.sliderView(view: self, needsPerform: .changeValueSlider(value: rs))
                
            }

}
extension MySliderView {
    enum Action {
        case changeValueSlider(value: Int)
    }
}
