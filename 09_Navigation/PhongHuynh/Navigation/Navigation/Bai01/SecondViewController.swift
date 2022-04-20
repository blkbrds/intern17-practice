import UIKit

final class SecondViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Second"
    }
    
    // MARK: - IBActions
    @IBAction private func push(_ sender: Any) {
        guard let navi = navigationController else { return }
        let vc = ThirdViewController()
        navi.pushViewController(vc, animated: true)
    }
    
    @IBAction private func pop(_ sender: Any) {
        guard let navi = navigationController else { return }
        navi.popViewController(animated: true)
    }
}
