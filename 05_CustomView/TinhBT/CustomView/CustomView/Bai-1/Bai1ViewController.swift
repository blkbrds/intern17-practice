
import UIKit

class Bai1ViewController: UIViewController {
    
    private let screenSize = UIScreen.main.bounds
    var xo: CGFloat = (UIScreen.main.bounds.width - 300)/4
    var yo: CGFloat = 100
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        self.view.addSubview(scrollView)
        setupUI()
    
    }
    private func setupUI() {
        
        for i in 0..<numberItem {
            let name1 = MyAvatar(frame: CGRect(x: xo, y: yo, width: imageWidth, height: imageHeight))
            name1.delegate = self
            name1.userName?.text = "name\(i)"
            name1.userAvatar?.image = UIImage(named: "avt")
            scrollView.addSubview(name1)
            if xo + imageWidth > screenSize.width - xo {
                xo = (UIScreen.main.bounds.width - 300)/4
                yo += imageHeight
            } else {
                xo += CGFloat(space) + imageWidth
            }
        }
        let a = numberItem / 3 + numberItem % 3
        let h1 = imageHeight * CGFloat(a)
        let h2 = space * (CGFloat(a) - 1) + 100
        let h3 = h1 + h2
        
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: h3)
        
    }
}

extension Bai1ViewController: MyAvatarDelegate {
    func myAvatar(_ myAvatar: MyAvatar, didSelect index: Int) {
        print("select user view ")
    }
}
