//
//  BT6ViewController.swift
//  BTView
//
//  Created by Tuan Tran V. VN.Danang on 4/28/22.
//

import UIKit

class BT6ViewController: UIViewController {
    let imageView = UIImageView()
    let imvChat = UIImageView()
    let lbChat = UILabel()
    var pinchGesture = UIPinchGestureRecognizer()
    var rotationGesture = UIRotationGestureRecognizer()
    var longPressGesture = UILongPressGestureRecognizer()
    var tapGesture = UITapGestureRecognizer()
    var maxScale:CGFloat = 2.0
    var minScale:CGFloat = 0.5
    var tapCount = 0

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
        
        imvChat.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        imvChat.image = UIImage(named: "ChatFrame")
        imvChat.backgroundColor = .red
        imvChat.contentMode = .scaleToFill
        imvChat.isHidden = true
        imvChat.addSubview(lbChat)
        view.addSubview(imvChat)
        
        lbChat.frame = CGRect(x: 0, y: 80, width: 200, height: 40)
        lbChat.text = ""
        lbChat.textAlignment = .center
//        lbChat.isHidden = true
        lbChat.backgroundColor = .clear
    }
    
    func addGesture() {
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.handlePinchGesture(pinchGesture:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(pinchGesture)
        
        rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(self.handleRotationGesture(rotationGesture:)))
        imageView.addGestureRecognizer(rotationGesture)
        
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(longPressGesture:)))
        longPressGesture.minimumPressDuration = 5
        imageView.addGestureRecognizer(longPressGesture)
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(tapGesture:)))
        tapGesture.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(tapGesture)
        
        
        
    }
    
    var recognizerScale:CGFloat = 1.0
    
    
    @objc func handleTapGesture(tapGesture: UITapGestureRecognizer){
        print("tap")
        guard tapGesture.view != nil else { return }
            tapCount += 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.handleTapCount(count: self.tapCount)
        }
    }
    
    private func handleTapCount(count: Int) {
        print("handleTap")
        tapCount = 0
        switch count {
        case 1:
            imvChat.isHidden = false
//            lbChat.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//                self.imvChat.alpha = 1.0
                UIView.animate(withDuration: 0.5) {
//                    self.imvChat.alpha = 0
                    self.imvChat.isHidden = true
                    
                }
            }
            lbChat.text = "Toi la khi"
        case 2:
            imvChat.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//                self.imvChat.alpha = 1.0
                UIView.animate(withDuration: 0.5) {
//                    self.imvChat.alpha = 0
                    self.imvChat.isHidden = true
                }
            }
            lbChat.text = "Khi la toi"
        default:
            break
        }
    }
    
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


