//
//  MySlideView.swift
//  CustomView
//
//  Created by luong.tran on 24/08/2022.
//

import UIKit

//Bước 1: Tạo protocol viewdelegate
protocol MySlideViewDelegate{
    func updateViewDelegate(view: MySlideView, thumbIndex: Int)
}

protocol MySlideViewDataSource: AnyObject {
    func getValueTextField() -> Int
}

class MySlideView: UIView {

    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var thumbIndex: UILabel!
    
    //Bước 2: Khai báo protocol viewdelegate
    var delegate: MySlideViewDelegate?
    var dataSource: MySlideViewDataSource? {
        didSet {
            guard let dataSource = dataSource else {
                return
            }
            updateView(value: dataSource.getValueTextField())
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }

    func configDelegate(value: Int){
        guard let delegate = delegate else {
            return
        }
        //Bước 3: Uỷ quyền viewdelegate
        delegate.updateViewDelegate(view: self, thumbIndex: value)
    }
    
    func configView(){
        whiteView.layer.cornerRadius = 10
        redView.layer.cornerRadius = 20
        blueView.layer.cornerRadius = 10
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
                thumbIndex.text = String(Int(percent))
                configDelegate(value: Int(percent))
            }
        }
    }
    
    func updateView(value: Int) {
        thumbIndex.text = "\(value)"
        let heightBlue = (Int(whiteView.bounds.height) * value) / 100
        let redCenterY = Int(whiteView.bounds.height) - heightBlue
        blueView.frame = CGRect(x: blueView.bounds.origin.x,
                                y: CGFloat(redCenterY),
                                width: blueView.bounds.size.width,
                                height: CGFloat(heightBlue))
        redView.center.y = CGFloat(redCenterY)
    }
}
