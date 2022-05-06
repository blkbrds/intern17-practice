import UIKit

final class TinhViewController: UIViewController {
    
    // MARK: - IBOutlects
    @IBOutlet private var tinhButton: [UIButton]!
    
    // MARK: - Properties
    var diadiem: DiaDiem?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Tỉnh"
        let backButton = UIBarButtonItem(image: UIImage(named: "back1.png"), style: .plain, target: self, action: #selector(leftAction))
        navigationItem.rightBarButtonItem = backButton
        let rightButton = UIBarButtonItem(title: "Huyện", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
        for button in tinhButton {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.blue.cgColor
        }
    }
    
    // MARK: - Objc functions
    @objc private func rightAction() {
        guard let navi = navigationController else { return }
        let vc = HuyenViewController()
        vc.diadiem = diadiem
        navi.pushViewController(vc, animated: true)
    }
    
    @objc private func leftAction() {
        guard let navi = navigationController else { return }
        navi.popViewController(animated: true)
    }
    
    // MARK: - IBActions
    @IBAction private func changeColerButton(_ sender: UIButton) {
        changecoler(tag: sender.tag)
        diadiem?.tinh = sender.tag
    }
    
    // MARK: Private functions
    private func changecoler(tag: Int) {
        for button in tinhButton {
            button.backgroundColor = button.tag == tag ? .orange : .white
        }
    }
}
