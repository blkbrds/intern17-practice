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
        
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonPressed(_:)))
        
        navigationItem.rightBarButtonItem = editButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usernameLabel.text = username
    }
    
    @objc private func editButtonPressed(_ sender: UIButton) {
        let editViewController = EditViewController()
        editViewController.delegate = self
        navigationController?.pushViewController(editViewController, animated: true)
    }
}

extension HomeViewController: EditViewControllerDelegate {
    func editView(_ view: EditViewController, data: String) {
        username = data
    }
}
