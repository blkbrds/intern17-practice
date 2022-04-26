//
//  CustomViewController.swift
//  ExerciseView
//
//  Created by thuan.nguyen on 22/04/2022.
//

import UIKit

class CustomViewController: UIViewController {

    var whiteView: UIView = UIView()
    var bluView: UIView = UIView()
    var circleView: UIView = UIView()
    var label: UILabel = UILabel()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    private func setupUI() {
        whiteView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 500))
        whiteView.center = view.center
        whiteView.backgroundColor = .white
        whiteView.layer.borderWidth = 1
        whiteView.layer.borderColor = UIColor.blue.cgColor
        view.addSubview(whiteView)
        
        bluView = UIView(frame: CGRect(x: 0, y: 0, width: whiteView.bounds.width, height: whiteView.bounds.height / 2))
        bluView.frame.origin.y = whiteView.bounds.size.height / 2
        bluView.backgroundColor = .blue
        whiteView.addSubview(bluView)
        
        circleView = UILabel(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        circleView.backgroundColor = .orange
        circleView.center = CGPoint(x: whiteView.bounds.width / 2, y: whiteView.bounds.height / 2)
        circleView.clipsToBounds = true
        circleView.layer.cornerRadius = circleView.bounds.width / 2
        whiteView.addSubview(circleView)
        // Add pangesture recognize
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePangestureOrangeView(_:)))
        circleView.addGestureRecognizer(panGesture)
        circleView.isUserInteractionEnabled = true
        

        label = UILabel(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        label.textAlignment = .center
        label.text = "50"
        label.textColor = .white
        circleView.addSubview(label)
        
    }
    
    @objc private func handlePangestureOrangeView(_ sender: UIPanGestureRecognizer) {
        
        let point = sender.location(in: whiteView)
        if point.y > whiteView.bounds.maxY {
            circleView.center.y = whiteView.bounds.maxY
        } else if point.y < whiteView.bounds.minY {
            circleView.center.y = whiteView.bounds.minY
        } else {
            circleView.center.y = point.y
        }
        updateUI()
        
    }
    private func updateUI() {
        // Update height of blue view
        // Update center of orange view
        // Update percent label
        bluView.frame = CGRect(x: bluView.frame.origin.x, y: circleView.center.y, width: whiteView.frame.width, height: whiteView.frame.height - circleView.center.y)
        let rs = Int((bluView.frame.height / whiteView.frame.height) * 100)
        label.text = "\(rs)"
    }

}
