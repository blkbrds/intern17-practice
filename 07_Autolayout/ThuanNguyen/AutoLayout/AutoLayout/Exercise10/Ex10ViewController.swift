//
//  Ex10ViewController.swift
//  AutoLayout
//
//  Created by thuan.nguyen on 09/05/2022.
//

import UIKit

class Ex10ViewController: UIViewController {
    @IBOutlet private weak var greenView: UIView!
    @IBOutlet private weak var yellowView: UIView!
    @IBOutlet private weak var blueView: UIView!
    @IBOutlet private weak var redView: UIView!
    
    @IBOutlet weak var blueConstraints: NSLayoutConstraint!
    @IBOutlet weak var yellowConstraints: NSLayoutConstraint!
    @IBOutlet weak var redConstraints: NSLayoutConstraint!
    var doubleView: UIView!
    var yPosition: CGFloat!
    var defaultYPosition: CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    private func setupUI() {
        addTapGesture()
    }
    private func addTapGesture() {
        let tapGreenGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGreen(_sender:)))
        greenView.addGestureRecognizer(tapGreenGesture)
        let tapYellowGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapYellow(_sender:)))
        yellowView.addGestureRecognizer(tapYellowGesture)
        let tapBlueGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapBlue(_sender:)))
        blueView.addGestureRecognizer(tapBlueGesture)
        let tapRedGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapRed(_sender:)))
        redView.addGestureRecognizer(tapRedGesture)
        doubleView = greenView
        yPosition = greenView.frame.origin.y
        defaultYPosition = greenView.frame.origin.y

    }

    @objc private func handleTapGreen(_sender: UITapGestureRecognizer) {
        if doubleView == greenView {return}
        handleAnimation(greenView)
    }
    @objc private func handleTapYellow(_sender: UITapGestureRecognizer) {
        if doubleView == yellowView {return}
        handleAnimation(yellowView)
    }
    @objc private func handleTapBlue(_sender: UITapGestureRecognizer) {
        if doubleView == blueView {return}
        handleAnimation(blueView)
    }
    @objc private func handleTapRed(_sender: UITapGestureRecognizer) {
        if doubleView == redView {return}
        handleAnimation(redView)
    }
    private func handleAnimation(_ changeView: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
                    self.changeDoubleView(changeView: changeView)
                 }) { (finished) in
                     UIView.animate(withDuration: 1, animations: {
                   })
                }
            
        }
    private func changeDoubleView(changeView: UIView) {
            doubleView.transform = doubleView.transform.scaledBy(x: 0.5, y: 0.5)
            changeView.transform = changeView.transform.scaledBy(x: 2, y: 2)
            changeYPosition()
            doubleView = changeView
        }
    private func changeYPosition() {
           yPosition = defaultYPosition
           greenView.frame.origin.y = yPosition
           yPosition += self.greenView.frame.width + 15
           yellowView.frame.origin.y = yPosition
           yPosition += self.yellowView.frame.width + 15
           blueView.frame.origin.y = yPosition
           yPosition += self.blueView.frame.width + 15
           redView.frame.origin.y = yPosition
       }
    }
    


