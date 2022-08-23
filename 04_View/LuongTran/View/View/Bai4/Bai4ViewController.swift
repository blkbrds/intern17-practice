//
//  Bai4ViewController.swift
//  View
//
//  Created by luong.tran on 19/08/2022.
//

import UIKit

class Bai4ViewController: UIViewController {

    
    @IBOutlet weak var lblAllColor: UILabel!
    @IBOutlet weak var tvBgColor: UITextView!
    @IBOutlet weak var sldRed: UISlider!
    @IBOutlet weak var sldGreen: UISlider!
    @IBOutlet weak var sldBlue: UISlider!
    
    @IBOutlet weak var lblRed: UILabel!
    @IBOutlet weak var lblGreen: UILabel!
    @IBOutlet weak var lblBlue: UILabel!
    
    var color: Color!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SliderColor()
    }

    func SliderColor(){
        color = Color(red: sldRed.value, green: sldGreen.value, blue: sldBlue.value)
        lblAllColor.text = color.getColor()
        tvBgColor.backgroundColor = color.getBgColor()
        
        
    }
    @IBAction func actionSldRed(_ sender: Any) {
        color.setRed(red: sldRed.value)
        lblRed.text = "\(sldRed.value)"
        SliderColor()
        
    }
    @IBAction func actionSldGreen(_ sender: Any) {
        color.setGreen(green: sldGreen.value)
        lblGreen.text = "\(sldGreen.value)"
        SliderColor()
    }
    @IBAction func actionSldBlue(_ sender: Any) {
        color.setBlue(blue: sldBlue.value)
        lblBlue.text = "\(sldBlue.value)"
        SliderColor()
    }
    
}
