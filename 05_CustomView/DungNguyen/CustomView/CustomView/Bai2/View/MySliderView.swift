//
//  MySliderView.swift
//  CustomView_bai1
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/17/22.
//

import UIKit

protocol MySliderDelegate: class {
    func selected(mySliderView: MySliderView, value: Int)
}

final class MySliderView: UIView {

    @IBOutlet private weak var redView: UIView!
    @IBOutlet private weak var blueView: UIView!
    @IBOutlet private weak var thumbnailView: UIView!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var parentView: UIView!
    
    var delegate: MySliderDelegate?
    var number: Int = 50 {
        didSet {
            updateSlider()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == thumbnailView {
                let location = touch.location(in: parentView)
                if location.y < parentView.bounds.minY {
                    thumbnailView.center.y = parentView.bounds.minY
                } else if location.y > parentView.bounds.maxY {
                    thumbnailView.center.y = parentView.bounds.maxY
                } else {
                    thumbnailView.center.y = location.y
                }
                blueView.frame = CGRect(x: blueView.frame.origin.x, y: thumbnailView.center.y, width: redView.frame.width, height: redView.frame.height - thumbnailView.center.y)
                let percent = Int((blueView.frame.height / parentView.frame.height) * 100)
                number = percent
            }
            delegate?.selected(mySliderView: self, value: number)
        }
    }
    
    private func updateSlider() {
        let ybluekView = (CGFloat(100 - number) * (parentView.frame.maxY) / 100)
        let heightView = CGFloat(number) * parentView.frame.size.height / 100
        blueView.frame = CGRect(x: blueView.frame.origin.x, y: ybluekView, width: redView.frame.size.width, height: heightView)
        thumbnailView.center.y = ybluekView
        let percent = Int(blueView.frame.size.height / parentView.frame.size.height * 100)
        numberLabel.text = "\(percent)"
    }
}
