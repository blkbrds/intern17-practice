import UIKit

final class Bai3ViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let email = CustomButtonView(frame: CGRect(x: 100, y: 100, width: 200, height: 80), number: 10, position: .topRight, name: "Email")
        view.addSubview(email)
        let friend = CustomButtonView(frame: CGRect(x: 100, y: 250, width: 200, height: 80), number: 100, position: .topLeft, name: "Friends")
        view.addSubview(friend)
        let photo = CustomButtonView(frame: CGRect(x: 100, y: 400, width: 200, height: 80), number: 8, position: .topCenter, name: "Photos")
        view.addSubview(photo)
    }
}
