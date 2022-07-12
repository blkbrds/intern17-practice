//
//  TinhViewController.swift
//  DemoProtocol
//
//  Created by thuan.nguyen on 19/05/2022.
//

import UIKit

class TinhViewController: UIViewController {

    @IBOutlet private var tinhButton: [UIButton]!
    
    var location: Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tỉnh"
        setupUI()
        boderUI() 
    }
    
    private func setupUI() {
        let rightButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(rightAction))
        let leftButton = UIBarButtonItem(title: "Mien", style: .plain, target: self, action: #selector(leftAction))
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc private func rightAction() {
        let vc = HuyenViewController()
        vc.location = location
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func leftAction() {
        guard let navi = navigationController else { return }
        navi.popViewController(animated: true)
    }
    
    private func boderUI() {
        for button in tinhButton {
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.systemGreen.cgColor
        }
    }
    
    private func changeColer(tag: Int) {
        for button in tinhButton {
            button.backgroundColor = button.tag == tag ? .systemGreen : .white
        }
    }
    
    @IBAction private func changeColorButton(_ sender: UIButton) {
        changeColer(tag: sender.tag)
        location?.tinh = sender.tag
    }
}
