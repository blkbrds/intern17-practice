//
//  BT3ViewController.swift
//  BTView
//
//  Created by Tuan Tran V. VN.Danang on 4/22/22.
//

import UIKit

final class BT3ViewController: UIViewController {
    
    lazy var barTotalView: UIView = {
        let v = UIView()
        return v
    }()
    
    lazy var barActionView: UIView = {
        let v = UIView()
        return v
    }()
    
    lazy var circleView: UIView = {
        let v = UIView()
        return v
    }()
    
    lazy var rateLabel: UILabel = {
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
        barTotalView.frame = frameViewBarTotal
        barTotalView.backgroundColor = .blue
        view.addSubview(barTotalView)
        
        let frameViewBarAction = CGRect(x: 19 / 40 * widthView, y: heightView / 4 , width: widthView / 20, height: heightView / 3)
        barActionView.frame = frameViewBarAction
        barActionView.backgroundColor = .red
        view.addSubview(barActionView)
        
        let frameViewCircle = CGRect(x: (widthView - 30) / 2  , y: heightView / 4 + heightView / 3 - 15, width: 30, height: 30)
        circleView.frame = frameViewCircle
        circleView.layer.cornerRadius = 15
        circleView.backgroundColor = .orange
        view.addSubview(circleView)
        
        let frameLabelRate = CGRect(x: 0 , y: 0, width: 30, height: 30)
        rateLabel.frame = frameLabelRate
        rateLabel.layer.cornerRadius = 15
        rateLabel.backgroundColor = .clear
        rateLabel.text = "70"
        rateLabel.font = UIFont.systemFont(ofSize: 10)
        rateLabel.textColor = .white
        rateLabel.textAlignment = .center
        circleView.addSubview(rateLabel)
        
    }
    
    private func addAction() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        circleView.addGestureRecognizer(pan)
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
                circleView.frame = CGRect(x: (view.frame.width - 30) / 2, y: yStartPoint - 15, width: 30, height: 30)
                barActionView.frame = CGRect(x: (19 * view.frame.width) / 40, y: yStartPoint, width: view.frame.width / 20, height: 0)
                rateLabel.text = "0"
            } else if location.y >= yEndPoint {
                circleView.frame = CGRect(x: (view.frame.width - 30) / 2, y: yEndPoint - 15, width: 30, height: 30)
                barActionView.frame = CGRect(x: (19 * view.frame.width) / 40, y: yStartPoint, width: view.frame.width / 20, height: view.frame.height / 2)
                rateLabel.text = "100"
            } else {
                if location.y >= yEndPoint - 15 &&
                    location.y < yEndPoint
                {
                    circleView.frame = CGRect(x: (view.frame.width - 30) / 2, y: yEndPoint - 15, width: 30, height: 30)
                    barActionView.frame = CGRect(x: (19 * view.frame.width) / 40, y: yStartPoint, width: view.frame.width / 20, height: location.y - yStartPoint)
                } else {
                    circleView.frame = CGRect(x: (view.frame.width - 30) / 2, y: location.y - 15, width: 30, height: 30)
                    barActionView.frame = CGRect(x: (19 * view.frame.width) / 40, y: yStartPoint, width: view.frame.width / 20, height: location.y - yStartPoint)
                }
                var rate = (location.y - yStartPoint) * 100 / (view.frame.height / 2)
                rateLabel.text = "\(round(rate))"
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
