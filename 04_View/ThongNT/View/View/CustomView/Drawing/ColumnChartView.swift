//
//  ColumnChartView.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/5/22.
//

import UIKit
protocol ColumnChartViewDataSource {
    func getPoints(in view: ColumnChartView) -> [IncomeValue]
}

@IBDesignable
final class ColumnChartView: UIView {
    
    var datasource: ColumnChartViewDataSource?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        getValueToDraw()
    }
    
    //MARK: - Internal function for datasource
    func getValueToDraw() {
        guard let values = datasource?.getPoints(in: self) else { return }
        let points = convertValuesIntoCGPoint(with: values)
        drawColumnChart(with: points)
    }
    
    //MARK: - Private functions
    private func convertValuesIntoCGPoint(with values: [IncomeValue]) -> [CGPoint] {
        var pointsFromValues: [CGPoint] = []
        var maxHorizontalValue: Int = 0
        var stepBetweenPoints: CGFloat = self.bounds.width / CGFloat(values.count + 1)
        var x: CGFloat = stepBetweenPoints
        let firstPoint = CGPoint(x: x, y: self.bounds.maxY)
        
        pointsFromValues.append(firstPoint)
        // Get max value to align percent between points
        values.forEach { (value) in
            if maxHorizontalValue < value.mount {
                maxHorizontalValue = value.mount
            }
        }
        
        // convert value to point
        values.forEach { (value) in
            var point = CGPoint()
            
            // Get vertical value
            point.x = x
            point.y = self.bounds.maxY -
                (CGFloat(value.mount * Int(self.bounds.height) / maxHorizontalValue))
            pointsFromValues.append(point)
            x += stepBetweenPoints
        }
        
        let endPoint = CGPoint(x: pointsFromValues.last!.x, y: self.bounds.maxY)
        pointsFromValues.append(endPoint)
        return pointsFromValues
    }
    
    private func drawColumnChart(with points: [CGPoint]) {
        let context = UIGraphicsGetCurrentContext()
        context?.addLines(between: points)
        context?.setFillColor(UIColor.systemYellow.cgColor)
        context?.fillPath()
    }
}
