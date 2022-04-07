//
//  Exercise05ViewController.swift
//  BaiTapView
//
//  Created by tri.nguyen on 31/03/2022.
//

import UIKit

final class Exercise05ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var smallView: UIView!
    @IBOutlet weak var percentLabel: UILabel!
    
    // MARK: - Properties
    private var value: CGFloat = 0.5 {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Exercise05"
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        bigView.layer.cornerRadius = 44
        bigView.layer.masksToBounds = true
        
        smallView.layer.cornerRadius = 44
        smallView.layer.masksToBounds = true
        
        percentLabel.textAlignment = .center
        percentLabel.font = .boldSystemFont(ofSize: 20)
        percentLabel.textColor = .white
        
        smallView.frame.size.height = bigView.frame.height
        updateUI()
    }
    
    private func updateUI() {
        smallView.frame.origin.y = (1 - value) * bigView.frame.height
        percentLabel.text = "\(Int(value * 100))%"
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: bigView)
            
            // Check touch insize bigview
            let insizeY = (location.y >= bigView.bounds.minY) && (location.y <= bigView.bounds.maxY)
            let insizeX = (location.x >= bigView.bounds.minX) && (location.x <= bigView.bounds.maxX)
            if insizeX && insizeY {
                // Update slider value
                value = 1 - (location.y / bigView.frame.height)
            }
        }
    }
}
