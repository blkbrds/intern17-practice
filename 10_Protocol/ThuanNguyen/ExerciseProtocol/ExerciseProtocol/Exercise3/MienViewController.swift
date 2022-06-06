//
//  MienViewController.swift
//  DemoProtocol
//
//  Created by thuan.nguyen on 19/05/2022.
//

import UIKit

final class MienViewController: UIViewController {
    
    @IBOutlet private var mienButton: [UIButton]!
    var loacation: Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Miền"
        setupUI()
        boderUI()
    }
    
    private func setupUI() {
        let rightButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
        let leftButton = UIBarButtonItem(title: "Dia diem", style: .plain, target: self, action: #selector(leftAction))
        navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc private func rightAction() {
        guard let navi = navigationController else { return }
        let vc = TinhViewController()
        vc.location = loacation
        navi.pushViewController(vc, animated: true)
    }
    
    @objc private func leftAction() {
        guard let navi = navigationController else { return }
        navi.popViewController(animated: true)
    }
    
    private func boderUI() {
        for button in mienButton {
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.blue.cgColor
        }
    }
    
    private func changeColer(tag: Int) {
        for button in mienButton {
            button.backgroundColor = button.tag == tag ? .systemBlue : .white
        }
    }
    
    @IBAction private func changeColorButton(_ sender: UIButton) {
        changeColer(tag: sender.tag)
        loacation?.mien = sender.tag
    }
}
