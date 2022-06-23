//
//  ColumnView.swift
//  Drawing
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/22/22.
//

import UIKit

final class ColumnView: UIView {
    
    // MARK: - override 
    override func draw(_ rect: CGRect) {
        let path = createPath()
        let fillColor = UIColor.orange
        fillColor.setFill()
        path.fill()
    }
    
    // MARK: - private func
    private func createPath() -> UIBezierPath {
        let path = UIBezierPath(rect: bounds)
        return path
    }
}
