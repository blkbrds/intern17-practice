//
//  Bai6ViewController.swift
//  View
//
//  Created by luong.tran on 22/08/2022.
//

import UIKit

class Bai6ViewController: UIViewController {

    @IBOutlet weak var imgMonkey: UIImageView!
    
    var imageSize: CGRect?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tabOnLong = UILongPressGestureRecognizer(target: self, action: #selector(onLongPress(_:)))
        tabOnLong.minimumPressDuration = 5
        view.addGestureRecognizer(tabOnLong)
    }
    
    @objc func onLongPress(_ sender: UILongPressGestureRecognizer) {
        imgMonkey.transform = CGAffineTransform(rotationAngle: 0)
        print("Reset Image")
    }

    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {

        let translation = sender.translation(in: view)

        guard let senderView = sender.view else{
            return
        }

        senderView.center = CGPoint(x: senderView.center.x + translation.x, y: senderView.center.y + translation.y)

        sender.setTranslation(.zero, in: view)
    }
    
    @IBAction func handlePinch(_ sender: UIPinchGestureRecognizer) {

        if sender.state == .ended || sender.state == .changed {
            if sender.scale < 2 && sender.scale > 0.5 {
                let transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
                self.imgMonkey?.transform = transform
            }

        }
    }
    

    @IBAction func handleRotate(_ sender: UIRotationGestureRecognizer) {
        guard let gestureView = sender.view else {
          return
        }

        gestureView.transform = gestureView.transform.rotated(
          by: sender.rotation
        )
        sender.rotation = 0
    }
}

extension Bai6ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(
      _ gestureRecognizer: UIGestureRecognizer,
      shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
    ) -> Bool {
      return true
    }
}
