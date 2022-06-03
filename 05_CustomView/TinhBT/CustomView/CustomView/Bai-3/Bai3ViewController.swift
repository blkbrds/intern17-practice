
import UIKit

final class Bai3ViewController: UIViewController {
    
    // MARK: - Properties
    let email = BadButtonView()
    let friends = BadButtonView()
    let photos = BadButtonView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }
    
    // MARK: - Private functions
    private func createView() {
        title = "bt3"
        email.frame = CGRect(x: 130, y: 100, width: 150, height: 100)
        email.backgroundColor = .green
        email.isShowBadge = true
        email.badgeNumber = 33
        email.setTitle("email", for: .normal)
        email.setTitleColor(.black, for: .normal)
        email.selectPosition = .topLeft
        email.layer.cornerRadius = 11
        view.addSubview(email)
        
        friends.frame = CGRect(x: 130, y: 300, width: 150, height: 100)
        friends.backgroundColor = .blue
        friends.isShowBadge = true
        friends.badgeNumber = 100
        friends.setTitle("Friends", for: .normal)
        friends.selectPosition = .bottomCenter
        friends.layer.cornerRadius = 15
        view.addSubview(friends)
        
        photos.frame = CGRect(x: 130, y: 500, width: 150, height: 100)
        photos.backgroundColor = .gray
        photos.isShowBadge = true
        photos.badgeNumber = 60
        photos.setTitle("Photos", for: .normal)
        photos.layer.cornerRadius = 15
        photos.selectPosition = .topRight
        view.addSubview(photos)
    }
}
