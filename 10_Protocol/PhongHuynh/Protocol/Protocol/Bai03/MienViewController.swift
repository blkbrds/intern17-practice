import UIKit

final class MienViewController: UIViewController {
    
    // MARK: - IBOutlect
    @IBOutlet private var mienButton: [UIButton]!
  
    // MARK: - Properties
    var diadiem: DiaDiem?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Miền"
        let backButton = UIBarButtonItem(image: UIImage(named: "back1.png"), style: .plain, target: self, action: #selector(leftAction))
        navigationItem.rightBarButtonItem = backButton
        let rightButton = UIBarButtonItem(title: "Tỉnh", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    // MARK: - Objc functions
    @objc func leftAction() {
        guard let navi = navigationController else { return }
        navi.popViewController(animated: true)
    }
    
    @objc func rightAction() {
        guard let navi = navigationController else { return }
        let vc = TinhViewController()
        vc.diadiem = diadiem
        navi.pushViewController(vc, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction private func changeColerButton(_ sender: UIButton) {
        changeColer(tag: sender.tag)
        diadiem?.mien = sender.tag
    }
    
    // MARK: - Private functions
    private func changeColer(tag: Int) {
        for button in mienButton {
            button.backgroundColor = button.tag == tag ? .red : .white
        }
    }
}
