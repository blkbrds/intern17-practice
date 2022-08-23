//
//  CustomUISliderViewController.swift
//  View
//
//  Created by luong.tran on 22/08/2022.
//

import UIKit

class CustomUISliderViewController: UIViewController {

    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var indexThumb: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configView()
        setBeginThumb()
    }

    func configView(){
        whiteView.layer.cornerRadius = 10
        redView.layer.cornerRadius = 25
        blueView.layer.cornerRadius = 10
    }

    func setBeginThumb() {
        let heightBlueNew = whiteView.frame.size.height - redView.center.y
        blueView.frame = CGRect(x: blueView.bounds.origin.x,
                                y: redView.center.y,
                                width: blueView.bounds.size.width,
                                height: heightBlueNew)
        let percent = (heightBlueNew / whiteView.bounds.height) * 100
        indexThumb.text = String(Int(percent))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            if touch.view == redView {
                let location = touch.location(in: whiteView)
                
                if location.y < whiteView.bounds.minY {
                    redView.center.y = whiteView.bounds.minY
                }else if location.y > whiteView.bounds.maxY {
                    redView.center.y = whiteView.bounds.maxY
                } else {
                    redView.center.y = location.y
                }
                let heightBlueNew = whiteView.frame.size.height - redView.center.y
                blueView.frame = CGRect(x: blueView.bounds.origin.x,
                                        y: redView.center.y,
                                        width: blueView.bounds.size.width,
                                        height: heightBlueNew)
                let percent = (heightBlueNew / whiteView.bounds.height) * 100
                print(heightBlueNew, whiteView.bounds.height, percent)
                indexThumb.text = String(Int(percent))
                
            }
        }
    }
    
}

