
import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // Mark: Private Functions
    private func setupUI() {
        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "ic-user"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleAspectFit
        view.addSubview(userAvatar)
        
        let username = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 50))
        username.text = "User name"
        username.textAlignment = .center
        username.backgroundColor = .lightGray
        username.textColor = .blue
        view.addSubview(username)
        
        let button = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 250))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func buttonDidClick() {
        print("button is clicked")
    }
}
