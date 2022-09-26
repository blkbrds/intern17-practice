//
//  TinhViewController.swift
//  Protocol
//
//  Created by luong.tran on 14/09/2022.
//

import UIKit

protocol TinhViewControllerDelegate: AnyObject {
    func vc(vc: TinhViewController, needPerform action: TinhViewController.Action)
}

protocol TinhViewControllerDataSource: AnyObject {
    func getValueTinh() -> [Int]
}

final class TinhViewController: UIViewController {
    
    enum Action {
        case sendInfo(idHuyen: Int, idTinh: Int, idMien: Int)
    }
    
    @IBOutlet private var tinhButtons: [UIButton]!
    
    weak var delegate: TinhViewControllerDelegate?
    weak var dataSource: TinhViewControllerDataSource?
    
    var currentIdTinh: Int = 1
    var currentIdMien: Int = 1
    var saveHuyen: [Int] = []

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
        currentIdTinh = dataSource.getValueTinh()[0]
        updateUI(tag: dataSource.getValueTinh()[0])
        saveHuyen.append(dataSource.getValueTinh()[1])
    }
    
    private func configNavigation() {
        title = Define.titleBar
        let huyenButton = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(huyenButtonTouchUpInside))
        navigationItem.rightBarButtonItem = huyenButton
    }

    private func configButton() {
        for tinhButton in tinhButtons {
            tinhButton.setTitle("Tỉnh: \(tinhButton.tag)", for: .normal)
            tinhButton.setTitleColor(.black, for: .normal)
            tinhButton.layer.borderWidth = 1.0
            tinhButton.layer.borderColor = UIColor.green.cgColor
            tinhButton.layer.cornerRadius = 10
            tinhButton.addTarget(self, action: #selector(tinhButtonTouchUpInside(sender:)), for: .touchUpInside)
        }
    }
    
    private func updateUI(tag: Int) {
        for (index, tinhButton) in tinhButtons.enumerated() {
            tinhButton.backgroundColor = (index + 1 == tag) ? UIColor.link : UIColor.white
        }
    }
    
    @objc private func tinhButtonTouchUpInside(sender: UIButton) {
        updateUI(tag: sender.tag)
        currentIdTinh = sender.tag
    }
    
    @objc private func huyenButtonTouchUpInside() {
        let huyenVC = HuyenViewController()
        huyenVC.currentIdTinh = currentIdTinh
        huyenVC.currentIdMien = currentIdMien
        huyenVC.delegate = self
        if !saveHuyen.isEmpty {
            huyenVC.dataSource = self
        }
        navigationController?.pushViewController(huyenVC, animated: true)
    }

}

extension TinhViewController {
    private struct Define {
        static var titleBar: String = "Tỉnh"
    }
}

extension TinhViewController: HuyenViewControllerDelegate {
    func vc(vc: HuyenViewController, needPerform action: HuyenViewController.Action) {
        switch action {
        case .sendInfo(idHuyen: let idHuyen, idTinh: let idTinh, idMien: let idMien):
            delegate?.vc(vc: self, needPerform: .sendInfo(idHuyen: idHuyen, idTinh: idTinh, idMien: idMien))
        }
    }
}

extension TinhViewController: HuyenViewControllerDataSource {
    func getValueHuyen() -> [Int] {
        saveHuyen
    }
}
