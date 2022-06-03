
import UIKit

final class Bai1ViewController: UIViewController {
    
    // MARK: - Properties
    private let screenSize = UIScreen.main.bounds
    var positionX: CGFloat = (UIScreen.main.bounds.width - 300)/4
    var positionY: CGFloat = 100
    let imageWidth: CGFloat = 100
    let imageHeight: CGFloat = 125
    var space: CGFloat = (UIScreen.main.bounds.width - 300)/4
    var name: String?
    let numberItem: Int = 31
    let scrollView: UIScrollView = {
            let v = UIScrollView()
            v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
            return v
        }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        self.view.addSubview(scrollView)
        setupUI()
    }
    
    // MARK: - Private fuctions
    private func setupUI() {
        for i in 0..<numberItem {
            let myAvatar = MyAvatar(frame: CGRect(x: positionX, y: positionY, width: imageWidth, height: imageHeight))
            myAvatar.delegate = self
            myAvatar.userName?.text = "name\(i)"
            myAvatar.userAvatar?.image = UIImage(named: "avt")
            scrollView.addSubview(myAvatar)
            if positionX + imageWidth > screenSize.width - positionX {
                positionX = (UIScreen.main.bounds.width - 300)/4
                positionY += imageHeight
            } else {
                positionX += CGFloat(space) + imageWidth
            }
        }
        let numberItemInScreenVertical = numberItem / 3 + numberItem % 3
        let totalImageHeaight = imageHeight * CGFloat(numberItemInScreenVertical)
        let totalSpaceInScreenVertical = space * (CGFloat(numberItemInScreenVertical) - 1) + 100
        let totalHeight = totalImageHeaight + totalSpaceInScreenVertical
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: totalHeight)
    }
}

// MARK: - MyAvatarDelegate
extension Bai1ViewController: MyAvatarDelegate {
    func myAvatar(_ myAvatar: MyAvatar, didSelect index: Int) {
        print("select user view ")
    }
}
