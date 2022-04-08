//
//  MySilderView.swift
//  CustomView
//
//  Created by tri.nguyen on 07/04/2022.
//

import Foundation
import UIKit

protocol MySliderDelegate {
    func changeSlider(with view: MySliderView, needPerform actions: MySliderView.Action)
}

final class MySliderView: UIView {
    
    // MARK: - Properties
    private var value: CGFloat = 0.5 {
        didSet {
            
        }
    }
    
    var delegate: MySliderDelegate?
    
    enum Action {
        case Number(input: String)
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var bigView: UIView!
    @IBOutlet private weak var smallView: UIView!
    @IBOutlet private weak var thumbLabel: UILabel!
    
    // MARK: - Private Function
    
    private func setupUI() {
        bigView.layer.cornerRadius = 44
        smallView.layer.cornerRadius = 44
        
        bigView.layer.masksToBounds = true
        smallView.layer.masksToBounds = true
        
        thumbLabel.textAlignment = .center
        thumbLabel.textColor = .white
        thumbLabel.font = .boldSystemFont(ofSize: 22)
    }
    
    private func updateUI() {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: bigView)
            
            
        }
    }
}
