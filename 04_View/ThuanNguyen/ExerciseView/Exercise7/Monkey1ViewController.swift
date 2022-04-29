//
//  Monkey1ViewController.swift
//  ExerciseView
//
//  Created by thuan.nguyen on 22/04/2022.
//

import UIKit

class Monkey1ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.alpha = 0
        label.layer.borderWidth = 1
        label.backgroundColor = .darkGray
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.textAlignment = .center
        label.lineBreakMode = .byClipping
        label.textColor = .white
        
        
        
        let tapOneGesture = UITapGestureRecognizer(target: self, action:#selector(tapAction(recognizer:)))
        tapOneGesture.numberOfTapsRequired = 1
        image.addGestureRecognizer(tapOneGesture)
        image.isUserInteractionEnabled = true
        
        let tapDoubleGesture = UITapGestureRecognizer(target: self, action: #selector(tapDoubleAction(recognizer:)))
        tapDoubleGesture.numberOfTapsRequired = 2
        image.addGestureRecognizer(tapDoubleGesture)
    }
    
    
    @objc func tapAction(recognizer: UITapGestureRecognizer) {
        guard recognizer.view != nil else { return }
        label.isHidden = false
        label.alpha = 1
        label.text = "I am monkey !!!"
    
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in UIView.animate(withDuration: 5.0) {
                self.label.alpha = 0
            }
        }
    }
    @objc func tapDoubleAction(recognizer: UITapGestureRecognizer) {
        guard recognizer.view != nil else { return }
        label.isHidden = false
        label.alpha = 1
        label.text = "Monkey's me !!!"
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in UIView.animate(withDuration: 5.0) {
                self.label.alpha = 0
            }
        }
    }
    

    

}
