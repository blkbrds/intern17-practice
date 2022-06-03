//
//  HuyenViewController.swift
//  Protocol
//
//  Created by Tinh Bui T. VN.Danang on 5/13/22.
//

import UIKit

final class HuyenViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private var huyenButtons: [UIButton]!
    
    // MARK: - Properties
    var diaDiem: DiaDiem?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createNavigation()
    }

    // MARK: - IBActions
    @IBAction private func huyenButtonTouchUpInside(_ sender: UIButton) {
        for button in huyenButtons {
            button.isSelected = button.tag == sender.tag
        }
        diaDiem?.huyen = sender.tag + 1
    }
    
    // MARK: - Private functions
    private func createNavigation() {
        title = "Huyện"
        let doneButton  = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    // MARK: - Objc funtions
    @objc private func done() {
        guard let navi = navigationController else {return}
        if let homevc = navi.viewControllers[0] as? DiaDiemViewController {
            homevc.datasouce = self
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - DiaDiemDataSouce
extension HuyenViewController: DiaDiemDataSouce {
    func getDiaDiem() -> DiaDiem {
        guard let diadiem = diaDiem else {
            return DiaDiem(mien: 0, tinh: 0, huyen: 0)
        }
        return diadiem
    }
}
