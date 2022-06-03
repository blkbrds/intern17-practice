//
//  DiaDiemViewController.swift
//  Protocol
//
//  Created by Tinh Bui T. VN.Danang on 5/13/22.
//

import UIKit

class DiaDiem {
    var mien: Int
    var tinh: Int
    var huyen: Int
    
    init(mien: Int, tinh: Int, huyen: Int) {
        self.mien = mien
        self.huyen = huyen
        self.tinh = tinh
    }
}

// MARK: DiaDiemDataSouce
protocol DiaDiemDataSouce: class {
    func getDiaDiem() -> DiaDiem
}

final class DiaDiemViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var mienLabel: UILabel!
    @IBOutlet private weak var tinhLabel: UILabel!
    @IBOutlet private weak var huyenLabel: UILabel!
    
    // MARK: - Property
    weak var datasouce: DiaDiemDataSouce?
    var diadiem: DiaDiem = DiaDiem(mien: 0, tinh: 0, huyen: 0)
    
    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Địa Điểm"
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(edit))
        navigationItem.rightBarButtonItem = editButton
    }
    
    // MARK: - Private function
    private func configUI() {
        guard let diadiem = datasouce?.getDiaDiem() else { return }
        mienLabel.text = "Mien \(diadiem.mien)"
        mienLabel.textColor = .blue
        tinhLabel.text = "tinh \(diadiem.tinh)"
        tinhLabel.textColor = .green
        huyenLabel.text = "Huyen \(diadiem.huyen)"
        huyenLabel.textColor = .orange
    }

    @objc private func edit() {
        let vc = MienViewController()
        vc.diaDiem = diadiem
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
