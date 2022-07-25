//
//  HeaderReusableView.swift
//  CollectionView
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/7/22.
//

import UIKit

final class HeaderReusableView: UICollectionReusableView {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var headerLabel: UILabel!
    
    // MARK: - Method
    func updateHeader(value: String) {
        headerLabel.text = value
    }
}
