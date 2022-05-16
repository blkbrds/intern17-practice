import UIKit

final class DiaDiem {
    
    // MARK: - Properties
    var mien: Int
    var tinh: Int
    var huyen: Int
    
    // MARK: - Init
    init(mien: Int, tinh: Int, huyen: Int) {
        self.mien = mien
        self.tinh = tinh
        self.huyen = huyen
    }
}

// MARK: - DiaDiemDatasouce
protocol DiaDiemDatasouce: class {
    
    func getDiaDiem() -> DiaDiem
}

final class DiaDiemViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var mienLabel: UILabel!
    @IBOutlet private weak var tinhLabel: UILabel!
    @IBOutlet private weak var huyenLabel: UILabel!
    
    // MARK: - Properties
    weak var datasouce: DiaDiemDatasouce?
    var diadiem: DiaDiem = DiaDiem(mien: 0, tinh: 0, huyen: 0)
    
    // MARK: Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Địa điểm"
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction))
        self.navigationItem.rightBarButtonItem = editButton
    }
    
    // MARK: - Private functions
    private func configUI() {
        guard let diadiem = datasouce?.getDiaDiem() else { return }
        mienLabel.text = "miền \(diadiem.mien)"
        mienLabel.textColor = .blue
        tinhLabel.text = "tỉnh \(diadiem.tinh)"
        tinhLabel.textColor = .orange
        huyenLabel.text = "huyện \(diadiem.huyen)"
        huyenLabel.textColor = .red
    }
    
    // MARK: - Objc functions
    @objc private func editAction() {
        let vc = MienViewController()
        vc.diadiem = diadiem
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
