//
//  Exercise05ViewController.swift
//  BaiTapView
//
//  Created by tri.nguyen on 31/03/2022.
//

import UIKit

final class Exercise05ViewController: UIViewController {
    
    // MARK: - Properties
    
    var containerView: UIView = UIView()
    var blueChildView: UIView = UIView()
    var labelView: UIView = UIView()
    var percentLabel: UILabel = UILabel()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Exercise05"
        //        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupUI()
    }
    
    
    // MARK: - Private Functions
    
    private func setupUI() {
        
        containerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 400))
        containerView.center = view.center
        containerView.backgroundColor = .white
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.blue.cgColor
        view.addSubview(containerView)
        
        let x: CGFloat = 0
        let y: CGFloat = containerView.bounds.height / 2
        let width: CGFloat = containerView.bounds.width
        let height: CGFloat = containerView.bounds.height / 2
        
        blueChildView = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        blueChildView.backgroundColor = .blue
        containerView.addSubview(blueChildView)
        
        labelView = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        labelView.backgroundColor = .orange
        labelView.center = CGPoint(x: containerView.bounds.width / 2, y: containerView.bounds.height / 2)
        labelView.clipsToBounds = true
        labelView.layer.cornerRadius = labelView.bounds.width / 2
        containerView.addSubview(labelView)
        
        percentLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        percentLabel.textAlignment = .center
        percentLabel.text = "50"
        percentLabel.textColor = .white
        labelView.addSubview(percentLabel)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: containerView)
            
            labelView.frame.origin.y = location.y
            
            if location.y > containerView.bounds.maxY {
                labelView.center.y = containerView.bounds.maxY
            } else if location.y < containerView.bounds.minY {
                labelView.center.y = containerView.bounds.minY
            } else {
                labelView.center.y = location.y
            }
                        
            blueChildView.frame = CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.height - labelView.center.y)
            let percent = Int((blueChildView.frame.height / containerView.frame.height) * 100)
            percentLabel.text = "\(percent) %"
        }
    }
}

