//
//  CustomSliderView.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/3/22.
//

import UIKit

protocol CustomSliderViewDelegate: class {
    func didChangeValue(view: CustomSliderView, value: Int)
}

protocol CustomSliderViewDataSource: class {
    func getChangeValue(view: CustomSliderView) -> Float
}

final class CustomSliderView: UIView {
    
    //MARK: -IBOutlet private variable
    @IBOutlet private weak var backgroundView: UIView!
    
    weak var delegate: CustomSliderViewDelegate?
    weak var dataSource: CustomSliderViewDataSource?
    
    //MARK: - Private Variables
    private var thumbLabel: UILabel = UILabel()
    private var colorView: UIView = UIView()
    private var currentPoint: CGPoint = .zero
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    //MARK: - Functions
    func setThumbPosistionBaseOnSet() {
        guard let dataSource = dataSource else { return }
        let newPercent = dataSource.getChangeValue(view: self)
        updateUI(with: newPercent)
    }
    
    //MARK: - Private Functions
    private func setupUI() {
        backgroundView.layer.cornerRadius = 45
        
        // Color View
        let heigthOfColorView = backgroundView.frame.size.height - backgroundView.bounds.midY
        colorView.frame = CGRect(x: 0,
                                 y: backgroundView.bounds.midY,
                                 width: backgroundView.frame.size.width,
                                 height: heigthOfColorView)
        colorView.backgroundColor = .systemBlue
        colorView.layer.cornerRadius = 45
        colorView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        backgroundView.addSubview(colorView)
        
        //Thumb Label
        thumbLabel.frame = CGRect(x: 0, y: backgroundView.bounds.midY - 60,
                                  width: backgroundView.frame.size.width,
                                  height: 120 )
        thumbLabel.text = "50"
        thumbLabel.textAlignment = .center
        thumbLabel.font = UIFont.boldSystemFont(ofSize: 40)
        thumbLabel.backgroundColor = .systemPink
        thumbLabel.clipsToBounds = true
        thumbLabel.layer.cornerRadius = 45
        backgroundView.addSubview(thumbLabel)
    }
    
    private func updateUI(with value: Float) {
        let b = backgroundView.frame.size.height
        let a = CGFloat(value) * b / 100
        let midY = backgroundView.bounds.maxY - a - 60
        thumbLabel.frame = CGRect(x: 0,
                                  y: midY,
                                  width: backgroundView.frame.size.width,
                                  height: 120 )
        setPercentOfSlide()
        setColorViewPosition()
        thumbLabel.setNeedsDisplay()
    }
    
    private func setThumbPosistionBaseOnTouch() {
        let topLimtit: CGFloat = -5
        let botLimit = backgroundView.bounds.maxY
        guard currentPoint.y >= topLimtit,
              currentPoint.y <= botLimit else  { return }
        
        let yCenter = currentPoint.y - thumbLabel.bounds.midY
        thumbLabel.frame = CGRect(x: 0,
                                  y: yCenter,
                                  width: backgroundView.frame.size.width,
                                  height: 120 )
        setPercentOfSlide()
        setColorViewPosition()
        thumbLabel.setNeedsDisplay()
    }
    
    private func setColorViewPosition() {
        let heigthOfColorView = backgroundView.bounds.maxY - thumbLabel.frame.midY
        colorView.frame = CGRect(x: 0,
                                 y: thumbLabel.frame.midY,
                                 width: backgroundView.frame.width,
                                 height: heigthOfColorView)
        colorView.setNeedsDisplay()
    }
    
    private func setPercentOfSlide() -> Int {
        let a = backgroundView.bounds.maxY - thumbLabel.frame.midY
        let b = backgroundView.frame.size.height
        let percent = a / b * 100
        thumbLabel.text = "\(Int(percent))"
        return Int(percent)
    }
    
    //MARK: - Override functions
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        currentPoint = touch.location(in: self.backgroundView)
        setThumbPosistionBaseOnTouch()
        guard let delegate = delegate else { return }
        delegate.didChangeValue(view: self, value: setPercentOfSlide())
    }
}
