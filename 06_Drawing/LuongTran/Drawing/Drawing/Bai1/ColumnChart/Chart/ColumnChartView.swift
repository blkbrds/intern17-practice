//
//  ColumnChartView.swift
//  Drawing
//
//  Created by luong.tran on 26/08/2022.
//

import UIKit

struct BarEntry{
    let score: Int
    let title: String
}

class ColumnChartView: UIView {
    
    //1. Enum, delegate
    //2. Outlet
    //3. Property
    //4. Lifecycle
    //5. Method, Override
    //6. Action
    //7. objc
    
    private let mainLayer: CALayer = CALayer()
    private let scrollView: UIScrollView = UIScrollView()
    var dataEntries: [BarEntry] = [] {
        didSet {
            mainLayer.sublayers?.forEach({$0.removeFromSuperlayer()})
            scrollView.contentSize = CGSize(width: frame.size.width, height:
                                                Define.barHeight + Define.space * CGFloat(dataEntries.count) + Define.contentSpace)
            mainLayer.frame = CGRect(x: 0, y: 0, width:
                                        scrollView.contentSize.width, height:
                                        scrollView.contentSize.height)
            for i in 0..<dataEntries.count {
                showEntry(index: i, entry: dataEntries[i])
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    override func layoutSubviews() {
       scrollView.frame = CGRect(x: 0, y: 0, width: frame.size.width,
       height: frame.size.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
       scrollView.layer.addSublayer(mainLayer)
       addSubview(scrollView)
    }
    
    private func showEntry(index: Int, entry: BarEntry) {
        let xPos: CGFloat = translateWidthValueToXPosition(value:
                                                            Float(entry.score) / Float(100.0))
        let yPos: CGFloat = Define.space + CGFloat(index) * (Define.barHeight + Define.space)
        drawBar(xPos: xPos, yPos: yPos)
        drawTextValue(xPos: xPos + 155.0, yPos: yPos + 4.0, textValue: "\(entry.score)")
        drawTitle(xPos: 16.0, yPos: yPos + 12.0, width: 80, height:
                    40.0, title: entry.title)
    }
    
    private func drawBar(xPos: CGFloat, yPos: CGFloat) {
        let barLayer = CALayer()
        barLayer.frame = CGRect(x: 100, y: yPos, width: xPos, height: 40.0)
        barLayer.backgroundColor = UIColor.red.cgColor
        mainLayer.addSublayer(barLayer)
    }
    
    private func drawTextValue(xPos: CGFloat, yPos: CGFloat, textValue: String) {
        let textLayer = CATextLayer()
        textLayer.frame = CGRect(x: xPos, y: yPos, width: Define.drawTextValueWidth, height: Define.drawTextValueHeight)
        textLayer.foregroundColor = UIColor.black.cgColor
        textLayer.backgroundColor = UIColor.clear.cgColor
        textLayer.alignmentMode = CATextLayerAlignmentMode.center
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.font = CTFontCreateWithName(UIFont.systemFont(ofSize: Define.fontSize).fontName as CFString, 0, nil)
        textLayer.fontSize = Define.fontSize
        textLayer.string = textValue
        mainLayer.addSublayer(textLayer)
    }
    
    private func drawTitle(xPos: CGFloat, yPos: CGFloat, width: CGFloat, height: CGFloat = 22, title: String) {
        let textLayer = CATextLayer()
        textLayer.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
        textLayer.foregroundColor = UIColor.black.cgColor
        textLayer.backgroundColor = UIColor.clear.cgColor
        textLayer.alignmentMode = CATextLayerAlignmentMode.left
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.font = CTFontCreateWithName(UIFont.boldSystemFont(ofSize: Define.fontSize).fontName as CFString, 0, nil)
        textLayer.fontSize = Define.fontSize
        textLayer.string = title
        mainLayer.addSublayer(textLayer)
    }
    
    private func translateWidthValueToXPosition(value: Float) -> CGFloat
    {
        let width = CGFloat(value) * (mainLayer.frame.width - Define.space)
        return abs(width)
    }
}

extension ColumnChartView {
    private struct Define {
        static let space: CGFloat = 40.0
        static let barHeight: CGFloat = 40.0
        static let contentSpace: CGFloat = 88.0
        static let fontSize: CGFloat = 14.0
        static let drawTextValueWidth: CGFloat = 33.0
        static let drawTextValueHeight: CGFloat = 80.0
    }
}
