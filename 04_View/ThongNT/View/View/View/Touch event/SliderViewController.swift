//
//  SliderViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 3/30/22.
//

import UIKit

final class SliderViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var whiteView: UIView!
    
    //MARK: - Variables
    private var thumbLabel: UILabel = UILabel()
    private var colorView: UIView = UIView()
    private var currentPoint: CGPoint = .zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Private Functions
    private func setupUI() {
        whiteView.layer.cornerRadius = 45
        
        // Color View
        let heigthOfColorView = whiteView.frame.size.height - whiteView.bounds.midY
        colorView.frame = CGRect(x: 0,
                                 y: whiteView.bounds.midY,
                                 width: whiteView.frame.size.width,
                                 height: heigthOfColorView)
        colorView.backgroundColor = .systemBlue
        colorView.layer.cornerRadius = 45
        colorView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        whiteView.addSubview(colorView)
        
        //Thumb Label
        thumbLabel.frame = CGRect(x: 0, y: whiteView.bounds.midY - 60,
                                  width: whiteView.frame.size.width,
                                  height: 120 )
        thumbLabel.text = "50"
        thumbLabel.textAlignment = .center
        thumbLabel.font = UIFont.boldSystemFont(ofSize: 40)
        thumbLabel.backgroundColor = .systemPink
        thumbLabel.clipsToBounds = true
        thumbLabel.layer.cornerRadius = 45
        whiteView.addSubview(thumbLabel)
    }
    
    private func setThumbPosistion() {
        let topLimtit: CGFloat = -5
        let botLimit = whiteView.bounds.maxY
        guard currentPoint.y >= topLimtit,
              currentPoint.y <= botLimit else  { return }
        
        let yCenter = currentPoint.y - thumbLabel.bounds.midY
        thumbLabel.frame = CGRect(x: 0,
                                  y: yCenter,
                                  width: whiteView.frame.size.width,
                                  height: 120 )
        setPercentOfSlide()
        setColorViewPosition()
        thumbLabel.setNeedsDisplay()
    }
    
    private func setColorViewPosition() {
        let heigthOfColorView = whiteView.bounds.maxY - thumbLabel.frame.midY
        colorView.frame = CGRect(x: 0,
                                 y: thumbLabel.frame.midY,
                                 width: whiteView.frame.width,
                                 height: heigthOfColorView)
        colorView.setNeedsDisplay()
    }
    
    private func setPercentOfSlide() {
        let a = whiteView.bounds.maxY - thumbLabel.frame.midY
        let b = whiteView.frame.size.height
        let percent = a / b * 100
        thumbLabel.text = "\(Int(percent))"
    }
    
    //MARK: - Override functions
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        currentPoint = touch.location(in: self.whiteView)
        setThumbPosistion()
    }
}
