//
//  MonkeyViewController.swift
//  BaiTap6
//
//  Created by tu.le2 on 14/06/2022.
//

import UIKit

class MonkeyViewController: UIViewController {
    @IBOutlet weak var viewLabel: UIView!
    @IBOutlet weak var txtSay: UILabel!
    @IBOutlet weak var monkeyImage: UIImageView!
    let start = CFAbsoluteTimeGetCurrent()/1000
    let tap = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLabel.layer.isHidden = true
        viewLabel.layer.cornerRadius = 30
        let singleTap: UITapGestureRecognizer =  UITapGestureRecognizer(target: self, action: #selector(handleSingleTap))
        singleTap.numberOfTapsRequired = 1
        monkeyImage.addGestureRecognizer(singleTap)
        let doubleTap: UITapGestureRecognizer =  UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        doubleTap.numberOfTapsRequired = 2
        monkeyImage.addGestureRecognizer(doubleTap)
    }
    @IBAction func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        guard let gestureView = gesture.view else {
            return
        }
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + translation.x,
            y: gestureView.center.y + translation.y
        )
        
        gesture.setTranslation(.zero, in: view)
        guard gesture.state == .ended else {
            return
        }
        
        let velocity = gesture.velocity(in: view)
        let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
        let slideMultiplier = magnitude / 200
        
        let slideFactor = 0.1 * slideMultiplier
        var finalPoint = CGPoint(
            x: gestureView.center.x + (velocity.x * slideFactor),
            y: gestureView.center.y + (velocity.y * slideFactor)
        )
        
        finalPoint.x = min(max(finalPoint.x, 0), view.bounds.width)
        finalPoint.y = min(max(finalPoint.y, 0), view.bounds.height)
        
        UIView.animate(
            withDuration: Double(slideFactor * 2),
            delay: 0,
            options: .curveEaseOut,
            animations: {
                gestureView.center = finalPoint
            }
        )
        let start = CFAbsoluteTimeGetCurrent()
        print(start)
    }
    @IBAction func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        guard let gestureView = gesture.view else {
            return
        }
        
        gestureView.transform = gestureView.transform.scaledBy(
            x: gesture.scale,
            y: gesture.scale
        )
        gesture.scale = 1
    }
    
    @IBAction func handleRotate(_ gesture: UIRotationGestureRecognizer) {
        guard let gestureView = gesture.view else {
            return
        }
        
        gestureView.transform = gestureView.transform.rotated(
            by: gesture.rotation
        )
        gesture.rotation = 0
    }
    @IBAction func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        guard let view = gesture.view else {
            return
        }
        UIView.animate(withDuration: 5.0) {
            view.transform = view.transform.scaledBy(x: 1.0, y: 1.0)
            view.transform = CGAffineTransform(rotationAngle: 0)
        }
    }
    
    @objc func handleSingleTap() {
        viewLabel.layer.isHidden = false
        txtSay.text = "Tôi là khỉ"
        _ = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    @objc func handleDoubleTap() {
        viewLabel.layer.isHidden = false
        txtSay.text = "Khỉ là tôi"
        _ = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @objc func fireTimer() {
        viewLabel.layer.isHidden = true
    }
}
