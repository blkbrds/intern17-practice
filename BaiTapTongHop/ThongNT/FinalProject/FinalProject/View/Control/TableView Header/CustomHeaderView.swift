//
//  CustomHeaderView.swift
//  FinalProject
//
//  Created by Thong Nguyen T. VN.Danang on 4/29/22.
//  Copyright © 2022 Asiantech. All rights reserved.
//

import UIKit

final class CustomHeaderView: UITableViewHeaderFooterView {

    @IBOutlet private weak var cancelButton: UIButton!

    var isDismiss: (() -> Void)?

    var viewModel: CustomHeaderViewModel?

    @IBAction private func dismissView(_ sender: UIButton) {
        isDismiss?()
    }
}
