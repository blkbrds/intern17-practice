//
//  DrawChartView.swift
//  Drawing
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/22/22.
//

import UIKit

final class DrawChartView: UIView {
    
    var values = [30, 45, 70, 80, 10, 35, 60]
    var colors: [UIColor] = [.blue, .green, .red, .yellow, .purple, .systemPink, .orange]
    var labels = ["Tue", "Wed", "Thu", "Fri", "Sat", "Sun", "Today"]
    
    var backgrounChartdColor: UIColor = UIColor.clear {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        drawBackGround()
        drawOxy()
        drawLine()
        drawValues()
    }
    
    private func drawBackGround() {
        let path = UIBezierPath(rect: self.bounds)
        let fillColor = backgrounChartdColor
        fillColor.setFill()
        path.fill()
    }
    
    private func drawOxy() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.bounds.size.height))
        path.addLine(to: CGPoint(x: self.bounds.size.width, y: self.bounds.size.height))
        UIColor.gray.setStroke()
        path.lineWidth = 2.0
        path.stroke()
        path.close()
    }
    
    private func drawValues() {
        let n = values.count + 1
        let detal = self.bounds.size.width / CGFloat(n)
        let height = self.bounds.size.height
        for i in 0..<values.count {
            let x = detal * CGFloat((i + 1)) - detal / 4
            let w = detal / 2
            let h = height / 100 * CGFloat(values[i])
            drawRectange(CGRect(x: x, y: height - h, width: w, height: h), color: colors[i])
            drawTitle(x: x, y: height + 10, title: labels[i])
        }
    }
    
    private func drawRectange(_ rect: CGRect, color: UIColor) {
        let path = UIBezierPath(rect: rect )
        color.setFill()
        path.fill()
        path.close()
    }
    
    private func drawLine() {
        var y = self.bounds.size.height - 50
        var index = 50
        for _ in 0..<5 {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0.0, y: y))
            path.addLine(to: CGPoint(x: self.bounds.size.width, y: y))
            UIColor.gray.setStroke()
            path.stroke()
            path.close()
            drawTextValue(x: -25 , y: y, index: "\(index)")
            y -= 50
            index += 50
        }
    }
    
    private func drawTitle( x: CGFloat, y: CGFloat, title: String) {
        let textLayer = CATextLayer()
        textLayer.frame = CGRect(x: x, y: y, width: 40, height: 20)
        textLayer.backgroundColor = UIColor.clear.cgColor
        textLayer.foregroundColor = UIColor.gray.cgColor
        textLayer.font = CTFontCreateWithName(UIFont.systemFont(ofSize: 0).fontName as CFString, 0, nil)
        textLayer.fontSize = 15
        textLayer.string = title
        self.layer.addSublayer(textLayer)
    }
    
    private func drawTextValue(x: CGFloat, y: CGFloat, index: String) {
        let textValue = CATextLayer()
        textValue.frame = CGRect(x: x, y: y, width: 30, height: 20)
        textValue.backgroundColor = UIColor.clear.cgColor
        textValue.foregroundColor = UIColor.gray.cgColor
        textValue.font = CTFontCreateWithName(UIFont.systemFont(ofSize: 0).fontName as CFString, 0, nil)
        textValue.fontSize = 14
        textValue.string = index
        self.layer.addSublayer(textValue)
    }
}
