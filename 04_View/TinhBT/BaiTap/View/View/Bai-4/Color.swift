//
//  Color.swift
//  View
//
//  Created by Tinh Bui T. VN.Danang on 4/19/22.
//

import UIKit

class Color {
    private var red: CGFloat
    private var green: CGFloat
    private var blue: CGFloat
    
    init(red: Float, green: Float, blue: Float) {
        self.red = CGFloat(red)
        self.blue = CGFloat(blue)
        self.green = CGFloat(green)
    }
    func setRed(red: Float) {
        self.red = CGFloat(red)
    }
    func setBlue(blue: Float) {
        self.blue = CGFloat(blue)
    }
    func setGreen(green: Float) {
        self.green = CGFloat(green)
    }
    func getColor() -> UIColor {
        let color = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
            
        return color
    }
    func getString()-> String {
        let string = "Color(R: \(Int(round(red))), G: \(Int(round(green))), B: \(Int(round(blue))) )"
        return string
    }
}

