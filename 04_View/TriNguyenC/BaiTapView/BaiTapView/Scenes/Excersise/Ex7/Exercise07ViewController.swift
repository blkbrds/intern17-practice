//
//  Exercise07ViewController.swift
//  BaiTapView
//
//  Created by tri.nguyen on 02/04/2022.
//

import UIKit

final class Exercise07ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var monkeyImageView: UIImageView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        let oneTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleOneTapGesture(recognizer:)))
        // Touch One
        oneTapGesture.numberOfTapsRequired = 1
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTapGesture(recognizer:)))
        // Touch Two
        doubleTapGesture.numberOfTapsRequired = 2
        
        // Activated
        monkeyImageView.isUserInteractionEnabled = true
        
        // Add Gesture
        monkeyImageView.addGestureRecognizer(oneTapGesture)
        monkeyImageView.addGestureRecognizer(doubleTapGesture)
        
        messageLabel.clipsToBounds = true
        messageLabel.layer.borderColor = UIColor.black.cgColor
        messageLabel.layer.borderWidth = 2
        messageLabel.layer.cornerRadius = 22
        messageLabel.backgroundColor = .systemBlue
        messageLabel.textColor = .white
        messageLabel.textAlignment = .center
        messageLabel.text = "I am monkey"
        
        messageLabel.isHidden = true
    }
        
    // Touch One
    @objc func handleOneTapGesture(recognizer: UITapGestureRecognizer) {
        guard recognizer.view != nil else { return }
        messageLabel.isHidden = false
        messageLabel.alpha = 1
        messageLabel.text = "I am monkey"
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            UIView.animate(withDuration: 5.0) {
                self.messageLabel.alpha = 0
            }
        }
    }
    
    // Touch Two
    @objc func handleDoubleTapGesture(recognizer: UITapGestureRecognizer) {
        guard recognizer.view != nil else { return }
        messageLabel.isHidden = false
        messageLabel.alpha = 1
        messageLabel.text = "Monkey is me"
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            UIView.animate(withDuration: 5.0) {
                self.messageLabel.alpha = 0
            }
        }
    }
}
