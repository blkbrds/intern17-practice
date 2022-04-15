import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Second VC"

        let leftButton = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(leftAction))
        navigationItem.leftBarButtonItem = leftButton
        let rightButton = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    
    

    @IBAction func pop(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func push(_ sender: Any) {
        let vc = ThirdViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func leftAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @objc func rightAction() {
        let vc = ThirdViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
