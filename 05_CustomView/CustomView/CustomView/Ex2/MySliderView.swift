//
//  MySliderView.swift
//  CustomView
//
//  Created by tri.nguyen on 11/04/2022.
//

import Foundation
import UIKit

// MARK: - Protocol
// Only for class conform
protocol MySliderDelegate: class {
    func mySliderView(view: MySliderView, needsPerform action: MySliderView.Action)
}

final class MySliderView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var thumbView: UIView!
    @IBOutlet weak var percentLabel: UILabel!
    
    // MARK: - Properties

    // Memory Leak
    weak var delegate: MySliderDelegate?
    var value: Int = 50 {
        didSet {
            updateSliderView()
        }
    }
    
    // MARK: - Life cycle
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Private Functions
    private func updateSliderView() {
        let yBlueView = (CGFloat(100 - value) * (containerView.frame.maxY - 25) / 100)
        let heightView = CGFloat(value) * containerView.frame.size.height / 100
        blueView.frame = CGRect(x: blueView.frame.origin.x, y: yBlueView, width: blueView.frame.size.width, height: heightView)
        thumbView.center.y = yBlueView
        let percent = (blueView.frame.size.height / containerView.frame.size.height) * 100
        percentLabel.text = "\(percent)%"
    }
    
    // MARK: - Touch Moved
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: containerView)
        guard let location = location else { return }
        
        thumbView.frame.origin.y = location.y
        if location.y > containerView.bounds.maxY {
            thumbView.center.y = containerView.bounds.maxY
        } else if location.y < containerView.bounds.minY {
            thumbView.center.y = containerView.bounds.minY
        } else {
            thumbView.center.y = location.y
        }
        
        blueView.frame = CGRect(x: blueView.frame.origin.x, y: thumbView.center.y, width: blueView.frame.width, height: containerView.frame.height - thumbView.center.y)
        
        let percent = Int((blueView.frame.height / containerView.frame.height) * 100)
        percentLabel.text = "\(percent)%"
        
        delegate?.mySliderView(view: self, needsPerform: .changeValueSlider(value: percent))
    }
}

// MARK: - Enum Action
extension MySliderView {
    enum Action {
        case changeValueSlider(value: Int)
    }
}
