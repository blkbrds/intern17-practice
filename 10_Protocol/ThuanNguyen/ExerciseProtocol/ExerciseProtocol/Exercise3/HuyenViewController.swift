//
//  HuyenViewController.swift
//  DemoProtocol
//
//  Created by thuan.nguyen on 19/05/2022.
//

import UIKit

class HuyenViewController: UIViewController {

    @IBOutlet private var huyenButton: [UIButton]!
    var location: Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Huyện"
        setupUI()
        boderUI()
    }
    
    private func setupUI() {
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc private func rightAction() {
        guard let navi = navigationController else { return }
        if let home = navi.viewControllers[0] as? DiaDiemViewController {
            home.datasource = self
        }
        navi.popToRootViewController(animated: true)
    }
    
    private func boderUI() {
        for button in huyenButton {
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.orange.cgColor
        }
    }
    
    private func changeColer(tag: Int) {
        for button in huyenButton {
            button.backgroundColor = button.tag == tag ? .orange : .white
        }
    }
    
    @IBAction private func changeColorButton(_ sender: UIButton) {
        changeColer(tag: sender.tag)
        location?.huyen = sender.tag
    }
}

extension HuyenViewController: loacationDatasouce {
    func getLocation() -> Location {
        guard let location = location else {
            return Location(mien: 0, tinh: 0, huyen: 0)
        }
        return location
    }
}
