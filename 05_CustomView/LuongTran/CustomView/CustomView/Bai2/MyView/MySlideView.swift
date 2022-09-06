//
//  MySlideView.swift
//  CustomView
//
//  Created by luong.tran on 24/08/2022.
//

import UIKit

//Bước 1: Tạo protocol viewdelegate
protocol MySlideViewDelegate{
    func view(view: MySlideView, needPerform action: MySlideView.Action)
}

protocol MySlideViewDataSource: AnyObject {
    func getValueTextField() -> Int
}

class MySlideView: UIView {

    enum Action {
        case updateThumb(thumbIndex: Int)
    }

    @IBOutlet private weak var whiteView: UIView!
    @IBOutlet private weak var blueView: UIView!
    @IBOutlet private weak var redView: UIView!
    @IBOutlet private weak var thumbIndex: UILabel!
    
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
    
    private func configView(){
        whiteView.layer.cornerRadius = Define.cornerRadius10
        redView.layer.cornerRadius = Define.cornerRadius20
        blueView.layer.cornerRadius = Define.cornerRadius10
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
                delegate?.view(view: self, needPerform: .updateThumb(thumbIndex: Int(percent)))
            }
        }
    }
    
    private func updateView(value: Int) {
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

extension MySlideView {
    private struct Define {
        static let cornerRadius10: CGFloat = 10
        static let cornerRadius20: CGFloat = 20
    }
}
