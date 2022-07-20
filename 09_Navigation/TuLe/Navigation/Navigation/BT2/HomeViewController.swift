import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet private weak var usernameLabel: UILabel!
    
    var username: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        title = "Home"
        
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTouchUpinside(_:)))
        
        navigationItem.rightBarButtonItem = editButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameLabel.text = username
    }
    
    @objc private func editButtonTouchUpinside(_ sender: UIButton) {
        let editViewController = EditViewController()
        editViewController.delegate = self
        navigationController?.pushViewController(editViewController, animated: true)
    }
}

extension HomeViewController: EditViewControllerDelegate {
    func editView(_ vc: EditViewController, needsPerform action: EditViewController.Action) {
        switch action {
        case .doneButtonTapped(value: let value):
            usernameLabel.text = value
        }
    }
}
