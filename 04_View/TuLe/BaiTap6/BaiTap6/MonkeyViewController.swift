//
//  MonkeyViewController.swift
//  BaiTap6
//
//  Created by tu.le2 on 14/06/2022.
//

import UIKit

final class MonkeyViewController: UIViewController {
    @IBOutlet private weak var sayView: UIView!
    @IBOutlet private weak var sayLabel: UILabel!
    @IBOutlet private weak var monkeyImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        sayView.layer.isHidden = true
        sayView.layer.cornerRadius = 30
        let singleTap: UITapGestureRecognizer =  UITapGestureRecognizer(target: self, action: #selector(handleSingleTap))
        singleTap.numberOfTapsRequired = 1
        monkeyImage.addGestureRecognizer(singleTap)
        let doubleTap: UITapGestureRecognizer =  UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        doubleTap.numberOfTapsRequired = 2
        monkeyImage.addGestureRecognizer(doubleTap)
    }
    
    @IBAction private func handlePan(_ gesture: UIPanGestureRecognizer) {
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
    }
    @IBAction private func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        guard let gestureView = gesture.view else {
            return
        }
        
        gestureView.transform = gestureView.transform.scaledBy(
            x: gesture.scale,
            y: gesture.scale
        )
        gesture.scale = 1
    }
    
    @IBAction private func handleRotate(_ gesture: UIRotationGestureRecognizer) {
        guard let gestureView = gesture.view else {
            return
        }
        
        gestureView.transform = gestureView.transform.rotated(
            by: gesture.rotation
        )
        gesture.rotation = 0
    }
    @IBAction private func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        guard let view = gesture.view else {
            return
        }
        UIView.animate(withDuration: 5.0) {
            view.transform = view.transform.scaledBy(x: 1.0, y: 1.0)
            view.transform = CGAffineTransform(rotationAngle: 0)
        }
    }
    
    @objc private func handleSingleTap() {
        sayView.layer.isHidden = false
        sayLabel.text = "Tôi là khỉ"
        _ = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    @objc private func handleDoubleTap() {
        sayView.layer.isHidden = false
        sayLabel.text = "Khỉ là tôi"
        _ = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @objc private func fireTimer() {
        sayView.layer.isHidden = true
    }
}
