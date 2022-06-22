//
//  MySliderView.swift
//  CustomView
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/20/22.
//

import UIKit
protocol MySliderViewDelegate: AnyObject {
    func moveSlider(view: MySliderView, value: Int)
}
final class MySliderView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var greenView: UIView!
    @IBOutlet private weak var orangeView: UIView!
    @IBOutlet private weak var blueView: UIView!
    @IBOutlet private weak var indexLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    
    // MARK: - Properties
    weak var delegate: MySliderViewDelegate?
    weak var dataSource: MySliderViewDataSource?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        orangeView.layer.cornerRadius = 30
        indexLabel.text = "50"
    }
    
    func getData()
    {
        guard let dataSource = dataSource else { return }
        updateSlider(value: dataSource.transferValueTextField())
    }
    // MARK: - Private methods
    
    private func updateSlider( value: Int) {
        indexLabel.text = "\(value)"
        orangeView.center.y = greenView.frame.height - CGFloat(value * (Int(greenView.frame.height) / 100))
        blueView.frame =  CGRect(x: greenView.frame.origin.x, y: orangeView.center.y , width: greenView.frame.width , height: CGFloat(value * (Int(greenView.frame.height) / 100)))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            if touch.view == orangeView {
                let location = touch.location(in: containerView)
                if location.y < containerView.bounds.minY {
                    orangeView.center.y = containerView.bounds.minY
                } else if location.y > containerView.bounds.maxY {
                    orangeView.center.y = containerView.bounds.maxY
                }
                else {
                    orangeView.center.y = location.y
                }
                blueView.frame = CGRect(x: greenView.frame.origin.x, y: orangeView.center.y, width: greenView.frame.width, height: (greenView.frame.height - orangeView.center.y))
                let percent = Int((blueView.frame.height / greenView.frame.height) * 100)
                indexLabel.text = "\(percent)"
                delegate?.moveSlider(view: self, value: percent)
            }
        }
    }
}
