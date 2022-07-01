import UIKit

final class HomeUserViewController: UIViewController {
    
    private let screenSize = UIScreen.main.bounds
    private let spaceX: Int = 10
    private var widthFrame: CGFloat = (UIScreen.main.bounds.width - 40)/3
    private var count: Int = 1
    private var userNumber: Int = 10
    private var userNameLabel: UILabel?
    private var currenView: MyUserView?
    
    let userScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        for i in 0...userNumber {
            let xFrame = (spaceX * (i % 3 + 1) + ((i % 3)) * Int(widthFrame))
            let yFrame = 145 * (count - 1) + spaceX * (count - 1)
            if xFrame < Int(UIScreen.main.bounds.width) {
                let myAvatar = MyUserView(frame: CGRect(x: xFrame, y: yFrame, width: Int(widthFrame), height: 145), name: "name\(i+1)", i: i)
                myAvatar.delegate = self
                userScrollView.addSubview(myAvatar)
            }
            if i % 3 == 2 {
                count += 1
            }
        }
        let heightContentScrollView: CGFloat = CGFloat(145 * (userNumber / 3 + 1) + (userNumber / 3 + 1) * spaceX)
        userScrollView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        userScrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: heightContentScrollView)
        view.addSubview(userScrollView)
        title = "Gradient View"
    }
}

extension HomeUserViewController: UserViewDelegate {

    func view(_ view: MyUserView, needsPerform action: MyUserView.Action) {
        switch action {
        case .tapped(let count):
            let profileViewController = ProfileViewController()
            profileViewController.username = "name\(count+1)"
            profileViewController.delegate = self
            currenView = view
            navigationController?.pushViewController(profileViewController, animated: true)
        }
    }
}

extension HomeUserViewController: ProfileViewControllerDelegate {
    func view(_ view: ProfileViewController, data: String) {
        guard let currenView = currenView else{
            return
        }
        
        currenView.nameLabel.text = data
    }
}
