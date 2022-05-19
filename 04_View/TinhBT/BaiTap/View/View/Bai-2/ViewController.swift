
import UIKit

final class ViewController: UIViewController {
    
    var names: [String] = ["name1", "name2", "name3", "name4", "name5", "name6", "name7", "name8", "name9"]
    private let screenWidth = UIScreen.main.bounds.width
    var xo: CGFloat = 30
    var yo: CGFloat = 100
    let imageWidth: CGFloat = 100
    let imageHeight: CGFloat = 100
    var space = 20
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // Mark: Private Functions
    private func setupUI() {
        for i in 0..<names.count {
            let name1 = MyView(frame: CGRect(x: xo, y: yo, width: imageWidth, height: imageHeight))
            name1.nameLabel?.text = names[i]
            name1.avatarImageView?.image = UIImage(named: "avt")
            view.addSubview(name1)
            if xo + imageWidth > screenWidth - xo {
                xo = 30
                yo += CGFloat(space) + imageHeight
            } else {
                xo += CGFloat(space) + imageWidth
            }
        }
    }
}
