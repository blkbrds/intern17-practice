//
//  TinhViewController.swift
//  Protocol
//
//  Created by Tinh Bui T. VN.Danang on 5/13/22.
//

import UIKit

final class TinhViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private var tinhButtons: [UIButton]!
    
    // MARK: - Property
    var diaDiem: DiaDiem?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createNavigation()
    }
    // MARK: - IBAction
    @IBAction private func tinhButtonTouchUpInside(_ sender: UIButton) {
        for button in tinhButtons {
            button.isSelected = button.tag == sender.tag
        }
        diaDiem?.tinh = sender.tag + 1 
    }
    
    // MARK: - Private function
    private func createNavigation() {
        title = "Tỉnh"
        let huyenButton  = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(moveToHuyen))
        navigationItem.rightBarButtonItem = huyenButton
    }
    
    @objc private func moveToHuyen() {
        let vc = HuyenViewController()
        vc.diaDiem = diaDiem
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
