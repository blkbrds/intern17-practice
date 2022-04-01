//
//  MonkeyViewController.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 3/30/22.
//

import UIKit

enum MonkeyMessage: String {
    case singleTap = "Tôi là khỉ"
    case doubleTap = "Khỉ là tôi"
}

final class MonkeyViewController: UIViewController {
    
    //MARK: - IBOulets
    @IBOutlet weak var monkeyImageView: UIImageView!
    
    //MARK: - Variables
    var messageLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setGestureForImage()
    }
    
    
    //MARK: - Private functions
    private func setupUI() {
        monkeyImageView.image = UIImage(named: "MonkeyImage")
        
        // Config message Label
        messageLabel.frame = CGRect(x: monkeyImageView.frame.minX,
                                    y: monkeyImageView.frame.minY,
                                    width: 100,
                                    height: 50)
        messageLabel.backgroundColor = .red
        messageLabel.font = UIFont.boldSystemFont(ofSize: 20)
        messageLabel.textAlignment = .center
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 0
        messageLabel.clipsToBounds = true
        messageLabel.layer.cornerRadius = 25
        messageLabel.isHidden = true
        view.addSubview(messageLabel)
    }
    
    private func showLabelView( monkeyMessage: MonkeyMessage) {
        switch monkeyMessage {
        case .singleTap:
            messageLabel.text = monkeyMessage.rawValue
        case .doubleTap:
            messageLabel.text = monkeyMessage.rawValue
        }
        messageLabel.isHidden = false
    }
    
    private func setGestureForImage() {
        let longPressGesture = UILongPressGestureRecognizer(target: self,
                                                action: #selector(handleLongPress))
        longPressGesture.minimumPressDuration = 1
        let zoomGesture = UIPinchGestureRecognizer(target: self,
                                                   action: #selector(handleZoom))
        let rotateGesture = UIRotationGestureRecognizer(target: self,
                                                        action: #selector(handleRotate))
        let singleTapGesture = UITapGestureRecognizer(target: self,
                                                      action: #selector(handleSingleTap))
        singleTapGesture.numberOfTapsRequired = 1
        let doubleTapGesture = UITapGestureRecognizer(target: self,
                                                      action: #selector(handleDoubleTap))
        doubleTapGesture.numberOfTapsRequired = 2
        singleTapGesture.require(toFail: doubleTapGesture)
        
        // Add gesture into MonkeyView
        monkeyImageView.addGestureRecognizer(longPressGesture)
        monkeyImageView.addGestureRecognizer(zoomGesture)
        monkeyImageView.addGestureRecognizer(rotateGesture)
        monkeyImageView.addGestureRecognizer(singleTapGesture)
        monkeyImageView.addGestureRecognizer(doubleTapGesture)
    }
    
    // MARK: - Handle gesture recognizer functions
    @objc private func handleSingleTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            showLabelView(monkeyMessage: .singleTap)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.messageLabel.isHidden = true
            }
        }
    }
    
    @objc private func handleDoubleTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            showLabelView(monkeyMessage: .doubleTap)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.messageLabel.isHidden = true
            }
        }
    }
    
    @objc private func handleLongPress(sender: UILongPressGestureRecognizer) {
        monkeyImageView.transform = .identity
    }
    
    @objc private func handleZoom(sender: UIPinchGestureRecognizer) {
        if sender.state == .changed || sender.state == .ended {
            var newScale = sender.scale
            if newScale < 0.5 {
                newScale = 0.5
            }
            if newScale > 2.0 {
                newScale = 2.0
            }
            let transform = CGAffineTransform(scaleX: newScale, y: newScale)
            self.monkeyImageView.transform = transform
        }
    }
    
    @objc private func handleRotate(sender: UIRotationGestureRecognizer) {
        if sender.state == .changed || sender.state == .ended {
            let transform = CGAffineTransform(rotationAngle: sender.rotation)
            monkeyImageView.transform = transform
        }
    }
}
