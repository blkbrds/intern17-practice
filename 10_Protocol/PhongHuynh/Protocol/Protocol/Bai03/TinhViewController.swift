import UIKit

class TinhViewController: UIViewController {

    @IBOutlet var tinhButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Tỉnh"
        let backButton = UIBarButtonItem(image: UIImage(named: "back1.png"), style: .plain, target: self, action: #selector(leftAction))
        navigationItem.rightBarButtonItem = backButton
        let rightButton = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
        
       
    }
    
    @objc func rightAction() {
        guard let navi = navigationController else { return }
        let vc = HuyenViewController()
        navi.pushViewController(vc, animated: true)
    }
    
    @objc func leftAction() {
        guard let navi = navigationController else { return }
        navi.popViewController(animated: true)
    }


}
