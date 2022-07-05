//
//  TinhViewController.swift
//  Protocol
//
//  Created by Tinh Bui T. VN.Danang on 5/13/22.
//

import UIKit

final class TinhViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private var tinhButtons: [UIButton]!
    
    // MARK: - Properties
    var diaDiem: DiaDiem?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createNavigation()
    }
    // MARK: - IBActions
    @IBAction private func tinhButtonTouchUpInside(_ sender: UIButton) {
        for button in tinhButtons {
            button.isSelected = button.tag == sender.tag
        }
        diaDiem?.tinh = sender.tag + 1 
    }
    
    // MARK: - Private functions
    private func createNavigation() {
        title = "Tỉnh"
        let huyenButton  = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(moveToHuyen))
        navigationItem.rightBarButtonItem = huyenButton
    }
    
    // MARK: - Objc fuctions
    @objc private func moveToHuyen() {
        let vc = HuyenViewController()
        vc.diaDiem = diaDiem
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
