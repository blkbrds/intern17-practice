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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setScale(viewChange: UIView, viewOthers: [UIView]) {
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            if self.isSelected {
                viewChange.transform = viewChange.transform.scaledBy(x: 1.5, y: 1.5)
                for indexView in 0..<viewOthers.count {
                    viewOthers[indexView].transform = viewOthers[indexView].transform.scaledBy(x: (10 / 6) - 1, y: (10 / 6) - 1)
                }
            } else {
                viewChange.transform = viewChange.transform.scaledBy(x: (10 / 6) - 1, y: (10 / 6) - 1)
                for indexView in 0..<viewOthers.count {
                    viewOthers[indexView].transform = viewOthers[indexView].transform.scaledBy(x: 1.5, y: 1.5)
                }
            }
         }) { (finished) in
             UIView.animate(withDuration: 1, animations: {
           })
        }
    }
    
    private func disableTap(viewsTap: [UITapGestureRecognizer], isEna: Bool) {
        for indexView in 0..<viewsTap.count {
            viewsTap[indexView].isEnabled = isEna
        }
    }

    @IBAction func greenViewDidTapped(_ sender: UIButton) {
        if isSelected {
            setScale(viewChange: greenView, viewOthers: [purpleView, yellowView, orangeView])
            disableTap(viewsTap: [purpleTap, yellowTap, orangeTab], isEna: false )
            isSelected = false
        } else {
            setScale(viewChange: greenView, viewOthers: [purpleView, yellowView, orangeView])
            disableTap(viewsTap: [purpleTap, yellowTap, orangeTab], isEna: true )
            isSelected = true
        }
    }
    
    @IBAction func purpleViewDidTapped(_ sender: UIButton) {
        if isSelected {
            setScale(viewChange: purpleView, viewOthers: [greenView, yellowView, orangeView])
            disableTap(viewsTap: [greenTap, yellowTap, orangeTab], isEna: false )
            isSelected = false
        } else {
            setScale(viewChange: purpleView, viewOthers: [greenView, yellowView, orangeView])
            disableTap(viewsTap: [greenTap, yellowTap, orangeTab], isEna: true )
            isSelected = true
        }
    }
    
    @IBAction func yellowViewDidTapped(_ sender: Any) {
        if isSelected {
            setScale(viewChange: yellowView, viewOthers: [greenView, purpleView, orangeView])
            disableTap(viewsTap: [greenTap, purpleTap, orangeTab], isEna: false )
            isSelected = false
        } else {
            setScale(viewChange: yellowView, viewOthers: [greenView, purpleView, orangeView])
            disableTap(viewsTap: [greenTap, purpleTap, orangeTab], isEna: true )
            isSelected = true
        }
    }
    
    @IBAction func orangeViewDidTapped(_ sender: Any) {
        if isSelected {
            setScale(viewChange: orangeView, viewOthers: [greenView, purpleView, yellowView])
            disableTap(viewsTap: [greenTap, purpleTap, yellowTap], isEna: false )
            isSelected = false
        } else {
            setScale(viewChange: yellowView, viewOthers: [greenView, purpleView, orangeView])
            disableTap(viewsTap: [greenTap, purpleTap, yellowTap], isEna: true )
            isSelected = true
        }
    }
}

