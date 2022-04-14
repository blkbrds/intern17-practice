import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        userAvatar()
    }
    
    // MARK: - Private functions
    private func userAvatar() {
        let khoangCach: CGFloat = 10
        let widthView: CGFloat = CGFloat((UIScreen.main.bounds.width - 40) / 3)
        for index in 0..<30 {
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
            let userView = UserView(frame: CGRect(x: x, y: y, width: widthView, height: 120), name: "name \(index)", count: index )
            userView.delegate = self
            view.addSubview(userView)
        }
    }
}
// MARK: - UserViewDelegate
extension HomeViewController: UserViewDelegate {
    func didTap(view: UserView, needsPerfom action: UserView.Action) {
        switch action {
        case .tap(let name):
            print(name)
        }
    }
}
