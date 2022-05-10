import UIKit

class User {
    var name: String
    var id: Int
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
}

final class Home3ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var scrollView: UIScrollView!
    
    // MARK: - Properties
    var users: [User] = []
    var id: Int = 0
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        for index in 0..<30 {
            users.append(User(name: "name \(index + 1)", id: index))
        }
        userAvatar()
    }
    
    // MARK: - Private functions
    private func userAvatar() {
        let khoangCach: CGFloat = 10
        let widthView: CGFloat = CGFloat((UIScreen.main.bounds.width - 40) / 3)
        for index in 0..<users.count {
            let x1 = khoangCach * (CGFloat(index) + 1)
            let x2 = widthView * CGFloat(index)
            var x = x1 + x2
            var y = khoangCach
            
            if x >= UIScreen.main.bounds.width {
                let indexWidth = index % 3
                let x1 = khoangCach * (CGFloat(indexWidth) + 1)
                let x2 = widthView * CGFloat(indexWidth)
                let indexHeight = index / 3
                x = x1 + x2
                y = khoangCach * (CGFloat(indexHeight) + 1) + 120 * CGFloat(indexHeight)
            }
            let avartarView = AvartarView(frame: CGRect(x: x, y: y, width: widthView, height: 120), name: users[index].name, id: index)
            avartarView.delegate = self
            scrollView.addSubview(avartarView)
        }
    }
}

// MARK: - AvartarViewDelegate
extension Home3ViewController: AvartarViewDelegate {
    func controller(view: AvartarView, needsPerfom actions: AvartarView.Action) {
        switch actions {
        case .tap(let name, let id):
            let vc = ProfileViewController()
            vc.name = name
            self.id = id
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: - ProfileViewControllerDelegate
extension Home3ViewController: ProfileViewControllerDelegate {
    func controller(view: ProfileViewController, needsPerfom actions: ProfileViewController.Action) {
        switch actions {
        case .tap(let username):
            users[id].name = username
            scrollView.subviews.forEach({ $0.removeFromSuperview() })
            userAvatar()
        }
    }
}
