//
//  BT3ViewController.swift
//  BTView
//
//  Created by Tuan Tran V. VN.Danang on 4/22/22.
//

import UIKit

final class BT3ViewController: UIViewController {
    
    lazy var viewBarTotal: UIView = {
        let v = UIView()
        return v
    }()
    
    lazy var viewBarAction: UIView = {
        let v = UIView()
        return v
    }()
    
    lazy var viewCircle: UIView = {
        let v = UIView()
        return v
    }()
    
    lazy var lbRate: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addAction()
    }
    
    
    
    private func setupView() {
        let widthView = view.frame.width
        let heightView = view.frame.height
        let frameViewBarTotal = CGRect(x: 19 / 40 * widthView , y: heightView / 4 , width: widthView / 20, height: heightView / 2)
        viewBarTotal.frame = frameViewBarTotal
        viewBarTotal.backgroundColor = .blue
        view.addSubview(viewBarTotal)
        
        let frameViewBarAction = CGRect(x: 19 / 40 * widthView, y: heightView / 4 , width: widthView / 20, height: heightView / 3)
        viewBarAction.frame = frameViewBarAction
        viewBarAction.backgroundColor = .red
        view.addSubview(viewBarAction)
        
        let frameViewCircle = CGRect(x: (widthView - 30) / 2  , y: heightView / 4 + heightView / 3 - 15, width: 30, height: 30)
        viewCircle.frame = frameViewCircle
        viewCircle.layer.cornerRadius = 15
        viewCircle.backgroundColor = .orange
        view.addSubview(viewCircle)
        
        let frameLabelRate = CGRect(x: 0 , y: 0, width: 30, height: 30)
        lbRate.frame = frameLabelRate
        lbRate.layer.cornerRadius = 15
        lbRate.backgroundColor = .clear
        lbRate.text = "70"
        lbRate.font = UIFont.systemFont(ofSize: 10)
        lbRate.textColor = .white
        lbRate.textAlignment = .center
        viewCircle.addSubview(lbRate)
        
    }
    
    private func addAction() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        viewCircle.addGestureRecognizer(pan)
    }
    
    @objc func handleTap(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let yStartPoint = view.frame.height / 4
        let yEndPoint = yStartPoint + view.frame.height / 2
        switch sender.state {
        case .began:
            print("bat dau")
        case .changed:
            print(" thay doi")
            if location.y <= yStartPoint {
                viewCircle.frame = CGRect(x: (view.frame.width - 30) / 2, y: yStartPoint - 15, width: 30, height: 30)
                viewBarAction.frame = CGRect(x: (19 * view.frame.width) / 40, y: yStartPoint, width: view.frame.width / 20, height: 0)
                lbRate.text = "0"
            } else if location.y >= yEndPoint {
                viewCircle.frame = CGRect(x: (view.frame.width - 30) / 2, y: yEndPoint - 15, width: 30, height: 30)
                viewBarAction.frame = CGRect(x: (19 * view.frame.width) / 40, y: yStartPoint, width: view.frame.width / 20, height: view.frame.height / 2)
                lbRate.text = "100"
            } else {
                if location.y >= yEndPoint - 15 &&
                    location.y < yEndPoint
                {
                    viewCircle.frame = CGRect(x: (view.frame.width - 30) / 2, y: yEndPoint - 15, width: 30, height: 30)
                    viewBarAction.frame = CGRect(x: (19 * view.frame.width) / 40, y: yStartPoint, width: view.frame.width / 20, height: location.y - yStartPoint)
                } else {
                    viewCircle.frame = CGRect(x: (view.frame.width - 30) / 2, y: location.y - 15, width: 30, height: 30)
                    viewBarAction.frame = CGRect(x: (19 * view.frame.width) / 40, y: yStartPoint, width: view.frame.width / 20, height: location.y - yStartPoint)
                }
                var rate = (location.y - yStartPoint) * 100 / (view.frame.height / 2)
                lbRate.text = "\(round(rate))"
            }
            case .cancelled:
                print("cancel")
            case .ended:
                print("ended")
            default:
                break
            }
    }
}
