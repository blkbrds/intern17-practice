import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        let nameLabel = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 50))
        nameLabel.text = "name"
        nameLabel.backgroundColor = .lightGray
        nameLabel.textColor = .blue
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
        let clickButton = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 250))
        clickButton.backgroundColor = .clear
        clickButton.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        view.addSubview(clickButton)
    }
    
    // MARK: - Objc functions
    @objc func buttonDidClick(){
        print("Button is clicked!")
    }
    
}
