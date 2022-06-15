//
//  MonkeyViewController.swift
//  View
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/15/22.
//

import UIKit

class MonkeyViewController: UIViewController{

    let minScale: CGFloat = 0.5
    let maxScale: CGFloat = 2.0
    var width: CGFloat = 0.0
    var height: CGFloat = 0.0
    var timer = Timer()
    
    @IBOutlet weak var monkeyImage: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        width = (self.monkeyImage.frame.size.width)
        height = (self.monkeyImage.frame.size.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.alpha = 0.0
        monkeyImage.isUserInteractionEnabled = true
        
        let longpress = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
        longpress.minimumPressDuration = 2.0
        monkeyImage.addGestureRecognizer(longpress)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchMonkey(pinchGesture:)))
        monkeyImage.addGestureRecognizer(pinch)

        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotateMonkey(rotateGesture:)))
        monkeyImage.addGestureRecognizer(rotate)
        
        let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleSingleTap))
        singleTap.numberOfTapsRequired = 1
        monkeyImage.addGestureRecognizer(singleTap)
        
        let doubleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        doubleTap.numberOfTapsRequired = 2
        monkeyImage.addGestureRecognizer(doubleTap)
    }
    
    @objc private func handleSingleTap() {
        UIView.animate(withDuration: 0.5) {
            self.contentView.alpha = 1.0
            self.titleLabel.text = "Tôi là khỉ"
        } completion: { _ in
            self.timer.invalidate()
            self.timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.hideContentView), userInfo: nil, repeats: false)
        }
    }
    
    @objc func handleDoubleTap() {
        UIView.animate(withDuration: 0.5) {
            self.contentView.alpha = 1.0
            self.titleLabel.text = "Khỉ là tôi"
        } completion: { _ in
            self.timer.invalidate()
            self.timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.hideContentView), userInfo: nil, repeats: false)
        }
    }
    
    @objc func hideContentView() {
        UIView.animate(withDuration: 0.5) {
            self.contentView.alpha = 0
        }
    }
    
    @objc func longPressed(longPress: UILongPressGestureRecognizer) {
        UIView.animate(withDuration: 0.3) {
            let newScale = self.width / self.monkeyImage.frame.size.width
            self.monkeyImage.transform = self.monkeyImage.transform.scaledBy(x: newScale, y: newScale)
            self.monkeyImage.transform = CGAffineTransform(rotationAngle: 0)
        }
    }
    
    @objc func pinchMonkey(pinchGesture: UIPinchGestureRecognizer) {
        if pinchGesture.state == .began || pinchGesture.state == .changed {
            let currentScale = self.monkeyImage.frame.width/self.monkeyImage.bounds.size.width
            var newScale = pinchGesture.scale
            if currentScale * pinchGesture.scale < minScale {
                newScale = minScale / currentScale
            } else if currentScale * pinchGesture.scale > maxScale {
                newScale = maxScale / currentScale
            }
            self.monkeyImage.transform = self.monkeyImage.transform.scaledBy(x: newScale, y: newScale)
            pinchGesture.scale = 1
        }
    }
    
    @objc func rotateMonkey(rotateGesture: UIRotationGestureRecognizer) {
        if rotateGesture.state == .began || rotateGesture.state == .changed {
            rotateGesture.view?.transform = rotateGesture.view!.transform.rotated(by: rotateGesture.rotation)
            rotateGesture.rotation = 0
           }
    }
}
