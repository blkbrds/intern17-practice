import UIKit

class MienViewController: UIViewController {
    
    @IBOutlet var mienButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Miền"

        let backButton = UIBarButtonItem(image: UIImage(named: "back1.png"), style: .plain, target: self, action: #selector(leftAction))
        navigationItem.rightBarButtonItem = backButton
        let rightButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func leftAction() {
        guard let navi = navigationController else { return }
        navi.popViewController(animated: true)
    }
    
    @objc func rightAction() {
        guard let navi = navigationController else { return }
        let vc = TinhViewController()
        navi.pushViewController(vc, animated: true)
    }
    
    @IBAction func changeColerButton(_ sender: Any) {
        for _ in mienButton {
            
        }
    }
}
