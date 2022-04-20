import UIKit

final class HuyenViewController: UIViewController, DiaDiemDatasouce {
    
    func getDiaDiem() -> DiaDiem {
        guard let diadiem = diadiem else {
            return DiaDiem(mien: 0, tinh: 0, huyen: 0)
        }
        return diadiem
    }
    
    // MARK: - IBOutlets
    @IBOutlet private var huyenButton: [UIButton]!
    
    // MARK: Properties
    var diadiem: DiaDiem?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Huyện"
        let backButton = UIBarButtonItem(image: UIImage(named: "back1.png"), style: .plain, target: self, action: #selector(leftAction))
        navigationItem.rightBarButtonItem = backButton
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    // MARK: - Objc functions
    @objc func rightAction() {
        guard let navi = navigationController else { return }
        if let homevc = navi.viewControllers[0] as? DiaDiemViewController {
            homevc.datasouce = self
        }
        navi.popToRootViewController(animated: true)
    }
    
    @objc func leftAction() {
        guard let navi = navigationController else { return }
        navi.popViewController(animated: true)
    }

    // MARK: - IBActions
    @IBAction private func changeColerButton(_ sender: UIButton) {
        changecoler(tag: sender.tag)
        diadiem?.huyen = sender.tag
    }
    
    // MARK: - Private functions
    private func changecoler(tag: Int) {
        for button in huyenButton {
            button.backgroundColor = button.tag == tag ? .blue : .white
        }
    }
    
}
