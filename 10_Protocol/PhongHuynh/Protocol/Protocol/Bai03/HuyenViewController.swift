import UIKit

final class HuyenViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private var huyenButton: [UIButton]!
    
    // MARK: Properties
    var diadiem: DiaDiem?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Huyện"
        configNavigation()
        configUI()
    }
    
    // MARK: - Private functions
    private func configNavigation() {
        let backButton = UIBarButtonItem(image: UIImage(named: "back1.png"), style: .plain, target: self, action: #selector(leftAction))
        navigationItem.rightBarButtonItem = backButton
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItem = rightButton
    }

    private func configUI() {
        for button in huyenButton {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.blue.cgColor
        }
    }

    private func changecoler(tag: Int) {
        for button in huyenButton {
            button.backgroundColor = button.tag == tag ? .blue : .white
        }
    }

    // MARK: - Objc functions
    @objc private func rightAction() {
        guard let navi = navigationController else { return }
        if let homevc = navi.viewControllers[0] as? DiaDiemViewController {
            homevc.datasouce = self
        }
        navi.popToRootViewController(animated: true)
    }

    @objc private func leftAction() {
        guard let navi = navigationController else { return }
        navi.popViewController(animated: true)
    }

    // MARK: - IBActions
    @IBAction private func changeColerButton(_ sender: UIButton) {
        changecoler(tag: sender.tag)
        diadiem?.huyen = sender.tag
    }
}

// MARK: - DiaDiemDatasouce
extension HuyenViewController: DiaDiemDatasouce {

    func getDiaDiem() -> DiaDiem {
        guard let diadiem = diadiem else {
            return DiaDiem(mien: 0, tinh: 0, huyen: 0)
        }
        return diadiem
    }
}
