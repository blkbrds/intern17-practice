import UIKit

protocol Bai05DetailViewControllerDelegate: class {
    func controler(view: Bai05DetailViewController, needsPerfom actions: Bai05DetailViewController.Action)
}

final class Bai05DetailViewController: UIViewController {
    
    enum Action {
        case reload
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var searchLabel: UILabel!
    
    // MARK: - Properties
    var search: String = ""
    weak var delegate: Bai05DetailViewControllerDelegate?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backAction))
        navigationItem.leftBarButtonItem = backButton
        searchLabel.text = search
    }
    
    @objc private func backAction() {
        guard let navi = navigationController else { return }
        navi.popToRootViewController(animated: true)
        self.delegate?.controler(view: self, needsPerfom: .reload)
        
    }
}

