//
//  MienViewController.swift
//  Protocol
//
//  Created by luong.tran on 14/09/2022.
//

import UIKit

protocol MienViewControllerDelegate: AnyObject {
    func vc(vc: MienViewController, needPerform action: MienViewController.Action )
}

protocol MienViewControllerDataSource: AnyObject {
    func getValue() -> [Int]
}

final class MienViewController: UIViewController {
    
    enum Action {
        case sendInfo(idHuyen: Int, idTinh: Int, idMien: Int)
    }
    
    @IBOutlet private var mienButtons: [UIButton]!
    
    weak var delegate: MienViewControllerDelegate?
    weak var dataSource: MienViewControllerDataSource?
    
    var currentIdMien: Int = 1
    var saveTinhHuyen: [Int] = []
    
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
        currentIdMien = dataSource.getValue()[0]
        updateUI(tag: dataSource.getValue()[0])
        saveTinhHuyen.append(dataSource.getValue()[1])
        saveTinhHuyen.append(dataSource.getValue()[2])
    }
    
    private func configNavigation() {
        title = Define.titleBar
        let tinhButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(tinhButtonTouchUpInside))
        navigationItem.rightBarButtonItem = tinhButton
    }
    
    private func configButton() {
        for mienButton in mienButtons {
            mienButton.setTitle("Miền: \(mienButton.tag)", for: .normal)
            mienButton.setTitleColor(.black, for: .normal)
            mienButton.layer.borderWidth = 1.0
            mienButton.layer.borderColor = UIColor.link.cgColor
            mienButton.layer.cornerRadius = 10
            mienButton.addTarget(self, action: #selector(mienButtonTouchUpInside(sender:)), for: .touchUpInside)
        }
    }

    private func updateUI(tag: Int) {
        for (index, mienButton) in mienButtons.enumerated() {
            mienButton.backgroundColor = (index + 1 == tag) ? UIColor.link : UIColor.white
        }
    }
    
    @objc private func mienButtonTouchUpInside(sender: UIButton) {
        updateUI(tag: sender.tag)
        currentIdMien = sender.tag
    }
    
    @objc private func tinhButtonTouchUpInside() {
        let tinhVC = TinhViewController()
        tinhVC.currentIdMien = currentIdMien
        tinhVC.delegate = self
        if !saveTinhHuyen.isEmpty {
            tinhVC.dataSource = self
        }
        navigationController?.pushViewController(tinhVC, animated: true)
    }

}

extension MienViewController {
    private struct Define {
        static var titleBar: String = "Miền"
    }
}

extension MienViewController: TinhViewControllerDelegate {
    func vc(vc: TinhViewController, needPerform action: TinhViewController.Action) {
        switch action {
        case .sendInfo(idHuyen: let idHuyen, idTinh: let idTinh, idMien: let idMien):
            delegate?.vc(vc: self, needPerform: .sendInfo(idHuyen: idHuyen, idTinh: idTinh, idMien: idMien))
        }
    }
}

extension MienViewController: TinhViewControllerDataSource {
    func getValueTinh() -> [Int] {
        saveTinhHuyen
    }
}
