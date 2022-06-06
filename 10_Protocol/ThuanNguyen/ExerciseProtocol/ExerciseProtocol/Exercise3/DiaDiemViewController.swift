//
//  DiaDiemViewController.swift
//  DemoProtocol
//
//  Created by thuan.nguyen on 19/05/2022.
//

import UIKit
final class Location {
    var mien: Int
    var tinh: Int
    var huyen: Int
    init(mien: Int, tinh: Int, huyen: Int) {
        self.mien = mien
        self.tinh = tinh
        self.huyen = huyen
    }
}
protocol loacationDatasouce: class {
    
    func getLocation() -> Location
}

final class DiaDiemViewController: UIViewController {

    @IBOutlet weak var huyenLabel: UILabel!
    @IBOutlet weak var tinhLabel: UILabel!
    @IBOutlet weak var mienLabel: UILabel!
    
    weak var datasource: loacationDatasouce?
    var location: Location = Location(mien: 0, tinh: 0, huyen: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Địa Điểm"
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    private func setupUI() {
        let rightButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func rightAction() {
        let vc = MienViewController()
        vc.loacation = location
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func updateUI() {
        guard let location = datasource?.getLocation() else { return }
        mienLabel.text = "Miền \(location.mien)"
        mienLabel.textColor = .blue
        tinhLabel.text = "Tỉnh \(location.tinh)"
        tinhLabel.textColor = .systemGreen
        huyenLabel.text = "Huyện \(location.huyen)"
        huyenLabel.textColor = .orange
    }
    

}
