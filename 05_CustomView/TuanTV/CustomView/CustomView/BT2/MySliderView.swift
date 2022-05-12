//
//  MySliderView.swift
//  CustomView
//
//  Created by Tuan Tran V. VN.Danang on 5/9/22.
//

import Foundation
import UIKit

final class MySliderView: UIView {
    var initialCenter = CGPoint()
    var rate: Int = 0
    var minValue: CGFloat = 25
    var maxValue: CGFloat = 525
    
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var rateView: UIView!
    
    @IBOutlet weak var thumbnailView: UIView!
    @IBOutlet weak var lbRate: UILabel!
    
    weak var delegate: SliderDelegate?
    
    override func awakeFromNib() {
        
        thumbnailView.layer.borderWidth = 1
        thumbnailView.backgroundColor = .clear
       
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        thumbnailView.addGestureRecognizer(panGesture)
    }
    
    @objc func handleGesture (_ panGesture : UIPanGestureRecognizer) {

        guard panGesture.view != nil else {return}
        let piece = panGesture.view!
        let translation = panGesture.translation(in: piece.superview)
        print(translation)
        
        if panGesture.state == .began {
            // Save the view's original position.
            self.initialCenter = piece.center
        }
        if panGesture.state != .cancelled {
            // Add the X and Y translation to the view's original position.
            let newCenter = CGPoint(x: initialCenter.x, y: initialCenter.y + translation.y)
            piece.center = newCenter
            if piece.center.y > maxValue {
                piece.center.y = maxValue
            } else if piece.center.y < minValue {
                piece.center.y = minValue
            }
            let rate = Int((piece.center.y - 25) * 100 / 500)
            reloadUI(rate: 100 - rate)
        }
        else {
            // On cancellation, return the piece to its original location.
            piece.center = initialCenter
        }
    }

    private func reloadUI(rate: Int) {
        lbRate.text = String(rate)
        thumbnailView.frame = CGRect(origin: CGPoint(x: 0, y: 500 - (rate * 500 / 100)), size: CGSize(width: 60, height: 50))
        rateView.frame = CGRect(origin: CGPoint(x: 15, y: 525), size: CGSize(width: 30, height: -1 * (rate * 500 / 100)))
    }
}
