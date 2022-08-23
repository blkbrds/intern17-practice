//
//  File.swift
//  View
//
//  Created by luong.tran on 19/08/2022.
//

import Foundation
import UIKit

class Color{
    
    var red: Float
    var green: Float
    var blue: Float
    
    init(red: Float, green: Float, blue: Float){
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    func setRed(red: Float) {
        self.red = red
    }
    
    func setGreen(green: Float) {
        self.green = green
    }
    
    func setBlue(blue: Float) {
        self.blue = blue
    }
    
    func getBgColor() -> UIColor {
        let color = UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1.0)
        return color
    }
    
    func getColor() -> String{
        return "Color (R: \(Int(red)), G: \(Int(green)), B: \(Int(blue)))"
    }
    
}
