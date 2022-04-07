//
//  Exercise6ViewController.swift
//  BaiTapView
//
//  Created by tri.nguyen on 01/04/2022.
//

import UIKit

final class Exercise6ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var monkeyImageView: UIImageView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIAndData()
    }
    
    // MARK: Private Functions
    
    private func setupUIAndData() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(regconizer:)))
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate(regconizer:)))
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(regconizer:)))
        longPressGesture.minimumPressDuration = TimeInterval(5.0)
        
        // add tapgesture
        monkeyImageView.isUserInteractionEnabled = true
        
        // add gesture on image
        monkeyImageView.addGestureRecognizer(pinchGesture)
        monkeyImageView.addGestureRecognizer(rotateGesture)
        monkeyImageView.addGestureRecognizer(longPressGesture)
    }

    // Objc tap
    // zoom hình theo tỉ lệ 0.5 -> 2.0
    @objc func handlePinch(regconizer: UIPinchGestureRecognizer) {
        guard let view = regconizer.view, regconizer.scale >= 0.5 && regconizer.scale <= 2.0 else { return }
        view.transform = view.transform.scaledBy(x: regconizer.scale, y: regconizer.scale)
    }
    
    // xoay hình
    @objc func handleRotate(regconizer: UIRotationGestureRecognizer) {
        guard let view = regconizer.view else { return }
        view.transform = view.transform.rotated(by: regconizer.rotation)
        regconizer.rotation = 0
    }
    
    // Nhấn giữ trong vòng 5s
    @objc func handleLongPress(regconizer: UILongPressGestureRecognizer) {
        guard let view = regconizer.view else { return }
        UIView.animate(withDuration: 5.0) {
            view.transform = view.transform.scaledBy(x: 1.0, y: 1.0)
            view.transform = CGAffineTransform(rotationAngle: 0)
        }
    }
}
