//
//  MokeyViewController.swift
//  View_bai6
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/16/22.
//

import UIKit

final class MokeyViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var catImage: UIImageView!
    
    //MARK: - MARK: Properties
    private var width: CGFloat = 0.0
    private var height: CGFloat = 0.0
    private let minScale: CGFloat = 0.5
    private let maxScale: CGFloat = 2.0
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catImage.isUserInteractionEnabled = true
        
        let tap =  UITapGestureRecognizer(target: self, action: #selector(tapCat))
        catImage.addGestureRecognizer(tap)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchCat(catGesture:)))
        catImage.addGestureRecognizer(pinch)
        
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotateCat(catGesture:)))
        catImage.addGestureRecognizer(rotate)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressCat(catGesture:)))
        longPress.minimumPressDuration = 3.0
        catImage.addGestureRecognizer(longPress)
    }
    // MARK: - Private methods
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        width = catImage.frame.width
        height = catImage.frame.height
    }
    // MARK: - Objcs
    @objc private func tapCat(){
        print("tap")
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
}
