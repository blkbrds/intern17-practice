//
//  CatViewController.swift
//  View_bai7
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/17/22.
//

import UIKit

final class CatViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var catImage: UIImageView!
    @IBOutlet private weak var labelView: UIView!
    
    //MARK: - MARK: Properties
    private var width: CGFloat = 0.0
    private var height: CGFloat = 0.0
    private var minScale: CGFloat = 0.5
    private var maxScale: CGFloat = 2.0
    private var timer = Timer()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelView.alpha = 0
        catImage.isUserInteractionEnabled = true
        
        let tap1 =  UITapGestureRecognizer(target: self, action: #selector(handleSingleTap))
        catImage.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
        tap2.numberOfTapsRequired = 2
        catImage.addGestureRecognizer(tap2)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchCat(catGesture:)))
        catImage.addGestureRecognizer(pinch)
        
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotateCat(catGesture:)))
        catImage.addGestureRecognizer(rotate)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressCat(catGesture:)))
        longPress.minimumPressDuration = 3.0
        catImage.addGestureRecognizer(longPress)
    }
    
    // MARK: - Objcs
    override func viewDidAppear(_ animated: Bool) {
        width = catImage.frame.width
        height = catImage.frame.height
    }
    
    @objc private func pinchCat(catGesture: UIPinchGestureRecognizer) {
        if catGesture.state == .began || catGesture.state == .changed {
            let currentScale = catImage.frame.width / width
            var newScale = catGesture.scale
            if currentScale * newScale < minScale {
                newScale = minScale / currentScale
            } else if currentScale * newScale > maxScale {
                newScale = maxScale / currentScale
            }
            catImage.transform = catImage.transform.scaledBy(x: newScale, y: newScale)
        }
    }
    
    @objc private func rotateCat(catGesture : UIRotationGestureRecognizer) {
        if catGesture.state == .began || catGesture.state == .changed {
            guard let gestureView = catGesture.view else { return }
            catGesture.view?.transform = gestureView.transform.rotated(by: catGesture.rotation)
            catGesture.rotation = 0
        }
    }
    
    @objc private func longPressCat(catGesture: UILongPressGestureRecognizer) {
        UIView.animate(withDuration: 0.5) {
            let newScale = self.width / self.catImage.frame.size.width
            print(newScale)
            self.catImage.transform = self.catImage.transform.scaledBy(x: newScale, y: newScale)
            self.catImage.transform = CGAffineTransform(rotationAngle: 0)
        }
    }
    
    @objc private func handleSingleTap() {
        UIView.animate(withDuration: 0.7)
        {
            self.labelView.alpha = 1.0
            self.textLabel.text = "I am a cat"
        }
        completion: {_ in
            self.timer.invalidate()
            self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.hideLabelView), userInfo: nil, repeats: false)
        }
    }
    
    @objc private func hideLabelView() {
        UIView.animate(withDuration: 0.7) {
            self.labelView.alpha = 0
        }
    }
    
    @objc private func handleDoubleTap() {
        UIView.animate(withDuration: 0.7)
        {
            self.labelView.alpha = 1.0
            self.textLabel.text = "Cat is me"
        }
        completion: {_ in
            self.timer.invalidate()
            self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.hideLabelView), userInfo: nil, repeats: false)
        }
    }
}
