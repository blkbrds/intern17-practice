import UIKit

final class DiaDiem {
    var mien: Int
    var tinh: Int
    var huyen: Int
    
    init(mien: Int, tinh: Int, huyen: Int) {
        self.mien = mien
        self.tinh = tinh
        self.huyen = huyen
    }
}

// MARK: - DiaDiemDatasouce
protocol DiaDiemDatasouce {
    
    func getDiaDiem() -> DiaDiem
}

final class DiaDiemViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var mienLabel: UILabel!
    @IBOutlet private weak var tinhLabel: UILabel!
    @IBOutlet private weak var huyenLabel: UILabel!
    
    // MARK: - Properties
    var datasouce: DiaDiemDatasouce?
    var diadiem: DiaDiem = DiaDiem(mien: 0, tinh: 0, huyen: 0)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let diadiem = datasouce?.getDiaDiem() else { return }
        mienLabel.text = "mien \(diadiem.mien)"
        mienLabel.textColor = .blue
        tinhLabel.text = "tinh \(diadiem.tinh)"
        tinhLabel.textColor = .orange
        huyenLabel.text = "huyen \(diadiem.huyen)"
        huyenLabel.textColor = .red
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Địa điểm"
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction))
        self.navigationItem.rightBarButtonItem = editButton
    }
    
    // MARK: - Objc functions
    @objc private func editAction() {
        let vc = MienViewController()
        vc.diadiem = diadiem
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
