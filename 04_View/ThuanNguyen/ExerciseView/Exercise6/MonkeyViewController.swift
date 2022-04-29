//
//  MonkeyViewController.swift
//  ExerciseView
//
//  Created by thuan.nguyen on 22/04/2022.
//

import UIKit

final class MonkeyViewController: UIViewController {

    @IBOutlet private weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rotaGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotaGesture(recognizer:)))
        image.addGestureRecognizer(rotaGesture)
        image.isUserInteractionEnabled = true
        
        let pinGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinGesture(recognizer:)))
        image.addGestureRecognizer(pinGesture)
        
        let pressGesture = UILongPressGestureRecognizer(target: self, action: #selector(pressGesture(recognizer:)))
        image.addGestureRecognizer(pressGesture)
    }

    @objc func handlePinGesture(recognizer: UIPinchGestureRecognizer) {
        guard let view = recognizer.view, recognizer.scale >= 0.5 && recognizer.scale <= 2.0 else { return }
        let transform = CGAffineTransform(scaleX: recognizer.scale, y: recognizer.scale)
        view.transform = transform
    }
    
    @objc func handleRotaGesture(recognizer: UIRotationGestureRecognizer) {
        guard let gestureView = recognizer.view else {return}
        gestureView.transform = gestureView.transform.rotated(by: recognizer.rotation)
        recognizer.rotation = 0
    }
    
    @objc func pressGesture(recognizer: UILongPressGestureRecognizer) {
        guard let view = recognizer.view else { return }
                UIView.animate(withDuration: 5.0) {
                    view.transform = view.transform.scaledBy(x: 1.0, y: 1.0)
                    view.transform = CGAffineTransform(rotationAngle: 0)
    }
    }

}
