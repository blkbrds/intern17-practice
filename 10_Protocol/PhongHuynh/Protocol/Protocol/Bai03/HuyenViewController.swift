import UIKit

class HuyenViewController: UIViewController {

    @IBOutlet var huyenButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Huyện"
        let backButton = UIBarButtonItem(image: UIImage(named: "back1.png"), style: .plain, target: self, action: #selector(leftAction))
        navigationItem.rightBarButtonItem = backButton
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
        
    }
    
    @objc func rightAction() {
        guard let navi = navigationController else { return }
        navi.popToRootViewController(animated: true)
    }
    
    @objc func leftAction() {
        guard let navi = navigationController else { return }
        navi.popViewController(animated: true)
    }


}
