import UIKit

// MARK: - AvartarViewDelegate
protocol AvartarViewDelegate: class {
    func didTap(view: AvartarView, needsPerfom action: AvartarView.Action)
}

class AvartarView: UIView {

    // MARK: - Define
    enum Action {
        case tap(name: String, id: Int)
    }

    // MARK: - Properties
    var name: String?
    var id: Int?
    weak var delegate: AvartarViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    // MARK: - Initialize
    convenience init(frame: CGRect, name: String, id: Int) {
        self.init(frame: frame)
        self.name = name
        self.id = id
    
        let userAvatar = UIImageView(image: UIImage(named: "husky.jpeg"))
        userAvatar.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height*4/5)
        userAvatar.contentMode = .scaleAspectFit
        self.addSubview(userAvatar)

        let userName = UILabel(frame: CGRect(x: 0, y: frame.size.height * 4 / 5, width: frame.size.width, height: frame.size.height / 5))
        userName.text = name
        userName.backgroundColor = .lightGray
        userName.textAlignment = .center
        userName.textColor = .blue
        self.addSubview(userName)

        let button = UIButton(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(nextButton), for: .touchUpInside)
        self.addSubview(button)
    }
    // MARK: - Objc functions
    @objc func nextButton() {
        if let delegate = delegate, let name = name, let id = id {
            delegate.didTap(view: self, needsPerfom: .tap(name: name, id: id))
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
