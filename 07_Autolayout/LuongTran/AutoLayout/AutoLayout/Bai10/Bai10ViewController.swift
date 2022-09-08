//
//  Bai10ViewController.swift
//  AutoLayout
//
//  Created by luong.tran on 07/09/2022.
//

import UIKit

class Bai10ViewController: UIViewController {

    @IBOutlet var orangeTab: UITapGestureRecognizer!
    @IBOutlet var yellowTap: UITapGestureRecognizer!
    @IBOutlet var purpleTap: UITapGestureRecognizer!
    @IBOutlet var greenTap: UITapGestureRecognizer!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var purpleView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var orangeView: UIView!
    
    private var isSelected: Bool = true
    
    var doubleView: UIView!
    var yPosition: CGFloat!
    var defaultYPosition: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setScale(view1: UIView, view2: UIView, view3: UIView, view4: UIView) {
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            if self.isSelected {
                view1.transform = view1.transform.scaledBy(x: 1.5, y: 1.5)
                view2.transform = view2.transform.scaledBy(x: (10 / 6) - 1, y: (10 / 6) - 1)
                view3.transform = view3.transform.scaledBy(x: (10 / 6) - 1, y: (10 / 6) - 1)
                view4.transform = view4.transform.scaledBy(x: (10 / 6) - 1, y: (10 / 6) - 1)
            } else {
                view1.transform = view1.transform.scaledBy(x: (10 / 6) - 1, y: (10 / 6) - 1)
                view2.transform = view2.transform.scaledBy(x: 1.5, y: 1.5)
                view3.transform = view3.transform.scaledBy(x: 1.5, y: 1.5)
                view4.transform = view4.transform.scaledBy(x: 1.5, y: 1.5)
            }
         }) { (finished) in
             UIView.animate(withDuration: 1, animations: {
           })
        }
    }
    
    private func enableTap(btn1: UITapGestureRecognizer, btn2: UITapGestureRecognizer, btn3: UITapGestureRecognizer, isEna: Bool) {
        btn1.isEnabled = isEna
        btn2.isEnabled = isEna
        btn3.isEnabled = isEna
    }

    @IBAction func greenViewDidTapped(_ sender: UIButton) {
        if isSelected {
            setScale(view1: greenView, view2: purpleView, view3: yellowView, view4: orangeView)
            enableTap(btn1: purpleTap, btn2: yellowTap, btn3: orangeTab, isEna: false)
            isSelected = false
        } else {
            setScale(view1: greenView, view2: purpleView, view3: yellowView, view4: orangeView)
            enableTap(btn1: purpleTap, btn2: yellowTap, btn3: orangeTab, isEna: true)
            isSelected = true
        }
    }
    
    @IBAction func purpleViewDidTapped(_ sender: UIButton) {
        if isSelected {
            setScale(view1: purpleView, view2: greenView, view3: yellowView, view4: orangeView)
            enableTap(btn1: greenTap, btn2: yellowTap, btn3: orangeTab, isEna: false)
            isSelected = false
        } else {
            setScale(view1: purpleView, view2: greenView, view3: yellowView, view4: orangeView)
            enableTap(btn1: greenTap, btn2: yellowTap, btn3: orangeTab, isEna: true)
            isSelected = true
        }
    }
    
    @IBAction func yellowViewDidTapped(_ sender: Any) {
        if isSelected {
            setScale(view1: yellowView, view2: purpleView, view3: orangeView, view4: greenView)
            enableTap(btn1: greenTap, btn2: purpleTap, btn3: orangeTab, isEna: false)
            isSelected = false
        } else {
            setScale(view1: yellowView, view2: purpleView, view3: orangeView, view4: greenView)
            enableTap(btn1: greenTap, btn2: purpleTap, btn3: orangeTab, isEna: true)
            isSelected = true
        }
    }
    
    @IBAction func orangeViewDidTapped(_ sender: Any) {
        if isSelected {
            setScale(view1: orangeView, view2: yellowView, view3: purpleView, view4: greenView)
            enableTap(btn1: greenTap, btn2: purpleTap, btn3: yellowTap, isEna: false)
            isSelected = false
        } else {
            setScale(view1: orangeView, view2: yellowView, view3: purpleView, view4: greenView)
            enableTap(btn1: greenTap, btn2: purpleTap, btn3: yellowTap, isEna: true)
            isSelected = true
        }
    }
}

