//
//  HuyenViewController.swift
//  Protocol
//
//  Created by luong.tran on 14/09/2022.
//

import UIKit

protocol HuyenViewControllerDelegate: AnyObject {
    func vc(vc: HuyenViewController, needPerform action: HuyenViewController.Action)
}

protocol HuyenViewControllerDataSource: AnyObject {
    func getValueHuyen() -> [Int]
}

final class HuyenViewController: UIViewController {
    
    enum Action {
        case sendInfo(idHuyen: Int, idTinh: Int, idMien: Int)
    }
    
    weak var delegate: HuyenViewControllerDelegate?
    weak var dataSource: HuyenViewControllerDataSource?
    
    @IBOutlet private var huyenButtons: [UIButton]!
    
    var currentIdHuyen: Int = 1
    var currentIdTinh: Int = 1
    var currentIdMien: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        configNavigation()
        configButton()
        saveColorBg()
    }
    
    private func saveColorBg() {
        guard let dataSource = dataSource else {
            return
        }
        currentIdHuyen = dataSource.getValueHuyen()[0]
        updateUI(tag: dataSource.getValueHuyen()[0])
    }
    
    private func configNavigation() {
        title = Define.titleBar
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTouchUpInside))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    private func configButton() {
        for huyenButton in huyenButtons {
            huyenButton.setTitle("Huyện: \(huyenButton.tag)", for: .normal)
            huyenButton.setTitleColor(.black, for: .normal)
            huyenButton.layer.borderWidth = 1.0
            huyenButton.layer.borderColor = UIColor.orange.cgColor
            huyenButton.layer.cornerRadius = 10
            huyenButton.addTarget(self, action: #selector(huyenButtonTouchUpInside(sender:)), for: .touchUpInside)
        }
    }
    
    private func updateUI(tag: Int) {
        for (index, huyenButton) in huyenButtons.enumerated() {
            huyenButton.backgroundColor = (index + 1 == tag) ? UIColor.link : UIColor.white
        }
    }
    
    @objc private func huyenButtonTouchUpInside(sender: UIButton) {
        updateUI(tag: sender.tag)
        currentIdHuyen = sender.tag
    }
    
    @objc private func doneButtonTouchUpInside() {
        delegate?.vc(vc: self, needPerform: .sendInfo(idHuyen: currentIdHuyen, idTinh: currentIdTinh, idMien: currentIdMien))
        navigationController?.popToRootViewController(animated: true)
    }

}


extension HuyenViewController {
    private struct Define {
        static var titleBar = "Huyện"
    }
}
