//
//  BT6ViewController.swift
//  BTView
//
//  Created by Tuan Tran V. VN.Danang on 4/28/22.
//

import UIKit

class BT6ViewController: UIViewController {
    let imageView = UIImageView()
    var pinchGesture = UIPinchGestureRecognizer()
    var rotationGesture = UIRotationGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addGesture()
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        let widthView = view.frame.width
        let heightView = view.frame.height
        imageView.frame = CGRect(x: widthView / 2 - 50, y: heightView / 2 - 50, width: 100, height: 100)
        imageView.image = UIImage(named: "AnimalImage")
        view.addSubview(imageView)
    }
    
    func addGesture() {
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.handlePinchGesture(pinchGesture:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(pinchGesture)
        
        rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(self.handleRotationGesture(rotationGesture:)))
        imageView.addGestureRecognizer(rotationGesture)
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(longPressGesture:)))
        longPressGesture.minimumPressDuration = 5
        imageView.addGestureRecognizer(longPressGesture)
        
    }
    
    var recognizerScale:CGFloat = 1.0
    var maxScale:CGFloat = 2.0
    var minScale:CGFloat = 0.5
    
    @objc func handleLongPressGesture(longPressGesture: UILongPressGestureRecognizer){
        guard longPressGesture.view != nil else { return }
        if longPressGesture.state == .ended {
            
            imageView.transform = CGAffineTransform.init(rotationAngle: 0)
            imageView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            
        }
    }
    
    @objc func handleRotationGesture(rotationGesture: UIRotationGestureRecognizer) {
        print("rotate = ", rotationGesture.rotation)
        guard rotationGesture.view != nil else { return }
        if rotationGesture.state == .began || rotationGesture.state == .changed {
            let rotationAngle = rotationGesture.rotation
            rotationGesture.view?.transform = CGAffineTransform.init(rotationAngle: rotationAngle)
        }
    }
    
    @objc func handlePinchGesture(pinchGesture : UIPinchGestureRecognizer) {
        print("pinch = ", pinchGesture.scale)
        guard pinchGesture.view != nil else { return }
        
        if pinchGesture.state == .began || pinchGesture.state == .changed{
            let scale = pinchGesture.scale
            if scale < 0.5 {
                pinchGesture.view?.transform = CGAffineTransform.init(scaleX: minScale, y: minScale)
            } else if scale > 2.0 {
                pinchGesture.view?.transform = CGAffineTransform.init(scaleX: maxScale, y: maxScale)
            } else {
                pinchGesture.view?.transform = CGAffineTransform.init(scaleX: scale, y: scale)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


