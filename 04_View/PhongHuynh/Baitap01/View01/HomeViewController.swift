import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add user avatar
        let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        let userAvatar = UIImageView(image: UIImage(named: "avatar.png"))
        userAvatar.frame = frame
        userAvatar.contentMode = .scaleToFill
        view.addSubview(userAvatar)
        
        //Add user name
        let Name = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 50))
        Name.text = "name"
        Name.backgroundColor = .lightGray
        Name.textColor = .blue
        Name.textAlignment = .center
        view.addSubview(Name)
        
        //Add button
        let button = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 250))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        view.addSubview(button)

    }
    @objc func buttonDidClick(){
        print("Button is clicked!")
    }
    
}
