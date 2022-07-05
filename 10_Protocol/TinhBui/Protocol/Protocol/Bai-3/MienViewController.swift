//
//  MienViewController.swift
//  Protocol
//
//  Created by Tinh Bui T. VN.Danang on 5/13/22.
//

import UIKit

final class MienViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private var mienButton: [UIButton]!
    
    // MARK: - Properties
    var diaDiem: DiaDiem?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createNavigation()
    }
    
    // MARK: - IBActions
    @IBAction private func mienButtonTouchUpInside(_ sender: UIButton) {
        for button in mienButton {
            button.isSelected = button.tag == sender.tag
        }
        diaDiem?.mien = sender.tag + 1
    }
    
    // MARK: - Private functions
    private func createNavigation() {
        title = "Miền"
         let tinhButton  = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(moveToTinh))
         navigationItem.rightBarButtonItem = tinhButton
    }
    
    // MARK: - Objc functions
    @objc private func moveToTinh() {
        let vc = TinhViewController()
        vc.diaDiem = diaDiem
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
