import UIKit

class DiaDiemViewController: UIViewController {

    @IBOutlet weak var mienLabel: UILabel!
    @IBOutlet weak var tinhLabel: UILabel!
    @IBOutlet weak var huyenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Địa điểm"
        
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction))
        self.navigationItem.rightBarButtonItem = editButton
    }
    
    @objc func editAction() {
        let vc = MienViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }


}
