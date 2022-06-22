import Foundation
import UIKit

struct BarEntry {
    let score: Int
    let title: String
}

class BarChartView: UIView {
    private let mainLayer: CALayer = CALayer()
    private let scrollView: UIScrollView = UIScrollView()
    let space: CGFloat = 40.0
    let barHeight: CGFloat = 20.0
    let contentSpace: CGFloat = 88.0
    
    var dataEntries: [BarEntry] = [] {
        didSet {
            scrollView.contentSize = CGSize(width: frame.size.width, height:
                                                barHeight + space * CGFloat(dataEntries.count) + contentSpace)
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
        for i in 0...6 {
            drawLine(start: CGPoint(x: 40, y: (485 - i * 60)), end: CGPoint(x: 600, y: (485 - i * 60)))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupView() {
        scrollView.layer.addSublayer(mainLayer)
        addSubview(scrollView)
    }
    
    override func layoutSubviews() {
        scrollView.frame = CGRect(x: 0, y: 60, width: frame.size.width,
                                  height: frame.size.height)
    }
    
    private func showEntry(index: Int, entry: BarEntry) {
        let xPos: CGFloat = translateWidthValueToXPosition(value:
                                                            Float(entry.score) / Float(100.0))
        let yPos: CGFloat = space + CGFloat(index) * (barHeight + space)
        drawBar(xPos: xPos, yPos: yPos)
        drawTitle(xPos: 16.0, yPos: yPos + 12.0, width: 150.0, height:
                    40.0, title: entry.title)
    }
    
    func drawLine(start: CGPoint, end: CGPoint) {
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.path = path.cgPath

        self.layer.addSublayer(shapeLayer)
    }
    
    private func drawBar(xPos: CGFloat, yPos: CGFloat) {
        let barLayer = CALayer()
        barLayer.frame = CGRect(x: yPos, y: 425 - xPos, width: 10, height: xPos)
        print(xPos)
        barLayer.backgroundColor = UIColor.red.cgColor
        mainLayer.addSublayer(barLayer)
    }
    
    private func drawTitle(xPos: CGFloat, yPos: CGFloat, width: CGFloat, height: CGFloat = 22, title: String) {
        if (Int("\(title)") ?? 15) % 2 == 1 {
            let textLayer = CATextLayer()
            textLayer.frame = CGRect(x: 10, y: yPos, width: width, height: height)
            textLayer.foregroundColor = UIColor.black.cgColor
            textLayer.backgroundColor = UIColor.clear.cgColor
            textLayer.alignmentMode = CATextLayerAlignmentMode.left
            textLayer.contentsScale = UIScreen.main.scale
            textLayer.font = CTFontCreateWithName(UIFont.boldSystemFont(ofSize: 14.0).fontName as CFString, 0, nil)
            textLayer.fontSize = 14
            textLayer.string = title
            mainLayer.addSublayer(textLayer)
        }
    }
    
    private func translateWidthValueToXPosition(value: Float) -> CGFloat
    {
        let width = CGFloat(value) * (mainLayer.frame.width - space)
        return abs(width)
    }
    
    
}
