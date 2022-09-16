//
//  DiaDiemViewController.swift
//  Protocol
//
//  Created by luong.tran on 13/09/2022.
//

import UIKit


final class DiaDiemViewController: UIViewController {

    @IBOutlet private weak var mienLabel: UILabel!
    @IBOutlet private weak var tinhLabel: UILabel!
    @IBOutlet private weak var huyenLabel: UILabel!

    private var arr: [Int] = [1, 1, 1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNaviagtion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mienLabel.text = "Miền: \(arr[0])"
        tinhLabel.text = "Tỉnh: \(arr[1])"
        huyenLabel.text = "Huyện: \(arr[2])"
    }
    
    private func configNaviagtion() {
        title = Define.titleBar
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTouchUpInside))
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc private func editButtonTouchUpInside() {
        let mienVC = MienViewController()
        mienVC.delegate = self
        if !arr.isEmpty {
            mienVC.dataSource = self
        }
        navigationController?.pushViewController(mienVC, animated: true)
    }
    
}

extension DiaDiemViewController {
    private struct Define {
        static var titleBar = "Địa Điểm"
    }
}

extension DiaDiemViewController: MienViewControllerDelegate{
    func vc(vc: MienViewController, needPerform action: MienViewController.Action) {
        switch action {
        case .sendInfo(idHuyen: let idHuyen, idTinh: let idTinh, idMien: let idMien):
            mienLabel.text = "Miền: \(idMien)"
            tinhLabel.text = "Tỉnh: \(idTinh)"
            huyenLabel.text = "Huyện: \(idHuyen)"
            arr.removeAll()
            arr.append(idMien)
            arr.append(idTinh)
            arr.append(idHuyen)
        }
    }
}
extension DiaDiemViewController: MienViewControllerDataSource {
    func getValue() -> [Int] {
        arr
    }
}
