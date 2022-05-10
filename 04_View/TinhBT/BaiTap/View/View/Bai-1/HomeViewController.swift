
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
        let userAvatarImageView = UIImageView(image: UIImage(named: "ic-user"))
        userAvatarImageView.frame = frame
        userAvatarImageView.contentMode = .scaleAspectFit
        view.addSubview(userAvatarImageView)
        
        let userNameImageView = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 50))
        userNameImageView.text = "User name"
        userNameImageView.textAlignment = .center
        userNameImageView.backgroundColor = .lightGray
        userNameImageView.textColor = .blue
        view.addSubview(userNameImageView)
        
        let buttonImageView = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 250))
        buttonImageView.backgroundColor = .clear
        buttonImageView.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        view.addSubview(buttonImageView)
    }
    
    @objc func buttonDidClick() {
        print("button is clicked")
    }
}
