//
//  Bai3HeaderView.swift
//  CollectionView
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/7/22.
//

import UIKit

final class Bai3HeaderView: UICollectionReusableView {

    // MARK: - IBOulet
    @IBOutlet private weak var sectionLabel: UILabel!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Function
    func updateHeader(section: String) {
        sectionLabel.text = section
    }
}
