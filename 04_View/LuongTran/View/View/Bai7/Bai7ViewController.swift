//
//  Bai7ViewController.swift
//  View
//
//  Created by luong.tran on 23/08/2022.
//

import UIKit

class Bai7ViewController: UIViewController {

    @IBOutlet weak var imgMonkey: UIImageView!
    @IBOutlet weak var lblAlert: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customUI()
        customAction()
    }
    
    func customUI(){
        lblAlert.layer.cornerRadius = 10
        lblAlert.isHidden = true
    }
    
    func customAction(){
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(tapMonkey))
        imgMonkey.isUserInteractionEnabled = true
        imgMonkey.addGestureRecognizer(tapGes)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapMonkey))
        doubleTap.numberOfTapsRequired = 2
        imgMonkey.addGestureRecognizer(doubleTap)
    }
    
    @objc func tapMonkey(){
        lblAlert.text = "Tôi là Khỉ"
        lblAlert.fadeIn()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            self.lblAlert.fadeOut()
        }
    }
    
    @objc func doubleTapMonkey(){
        lblAlert.text = "Khỉ là tôi"
        lblAlert.fadeIn()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            self.lblAlert.fadeOut()
        }
    }

}

extension UIView {

    func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
       self.alpha = 0.0

       UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
           self.isHidden = false
           self.alpha = 1.0
       }, completion: completion)
    }
    
    func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
       self.alpha = 0.0

       UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseOut, animations: {
           self.isHidden = true
           self.alpha = 1.0
       }, completion: completion)
    }
}
