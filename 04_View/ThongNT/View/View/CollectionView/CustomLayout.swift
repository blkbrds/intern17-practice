//
//  CustomLayout.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/18/22.
//

import UIKit

protocol CustomLayoutDelegate: AnyObject {
    func collectionView(
        _ collectionView: UICollectionView,
        heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
}

final class CustomLayout: UICollectionViewLayout {
    weak var delegate: CustomLayoutDelegate?
    
    private let numberOfColumns = 4
    private let cellPadding: CGFloat = 6
    private var contentHeight: CGFloat = 0
    private var layoutAtributes: [UICollectionViewLayoutAttributes] = []
    
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        super.prepare()
        guard layoutAtributes.isEmpty,
              let collectionView = collectionView,
              numberOfColumns != 0 else { return }
        
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffsets: [CGFloat] = []
        for column in 0..<numberOfColumns {
            xOffsets.append(CGFloat(column) * columnWidth)
        }
        var column = 0
        var yOffsets: [CGFloat] = .init(repeating: 0, count: numberOfColumns)
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let photoHeight = delegate?.collectionView(
                collectionView,
                heightForPhotoAtIndexPath: indexPath) ?? 180
            let height = cellPadding * 2 + photoHeight
            let frame = CGRect(x: xOffsets[column],
                               y: yOffsets[column],
                               width: columnWidth,
                               height: height)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            layoutAtributes.append(attributes)
            contentHeight = max(contentHeight, frame.maxY)
            yOffsets[column] = yOffsets[column] + height
            
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect)
    -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
        
        // Loop through the cache and look for items in the rect
        for attributes in layoutAtributes {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath)
    -> UICollectionViewLayoutAttributes? {
        return layoutAtributes[indexPath.item]
    }
}
