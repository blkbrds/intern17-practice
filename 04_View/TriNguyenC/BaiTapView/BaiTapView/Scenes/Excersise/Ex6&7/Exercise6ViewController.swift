//
//  Exercise6ViewController.swift
//  BaiTapView
//
//  Created by tri.nguyen on 01/04/2022.
//

import UIKit

final class Exercise6ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var avatarImageView: UIImageView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    // Tap
    @IBAction func handlePan(_ recognizer: UIPanGestureRecognizer) {
        let transalation = recognizer.translation(in: view)
        guard let recognizerView = recognizer.view else {
            return
        }
        
        recognizerView.center = CGPoint(x: recognizerView.center.x + transalation.x,
                                        y: recognizerView.center.y + transalation.y)
        recognizer.setTranslation(.zero, in: view)
    }
    
    // Zoom Big And Small
    @IBAction func handlePinch(_ recognizer: UIPinchGestureRecognizer) {
        recognizer.view?.transform = (recognizer.view?.transform)!.scaledBy(x: recognizer.scale, y: recognizer.scale)
        recognizer.scale = 1.0
    }
    
    // Rotation
    @IBAction func handleRotation(_ recognizer: UIRotationGestureRecognizer) {
        var original = CGFloat()
        var last: CGFloat = 0
        
        if recognizer.state == .began {
            recognizer.rotation = last
            original = recognizer.rotation
        } else if recognizer.state == .changed {
            let new = recognizer.rotation + original
            recognizer.view?.transform = CGAffineTransform(rotationAngle: new)
         } else if recognizer.state == .ended {
            last = recognizer.rotation
         }
    }
    
    @IBAction func tapGesture(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            let alert = UIAlertController(title: "", message: "Tôi Là Khỉ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "", style: .default))
            self.present(alert, animated: true)
        }
    }
}
