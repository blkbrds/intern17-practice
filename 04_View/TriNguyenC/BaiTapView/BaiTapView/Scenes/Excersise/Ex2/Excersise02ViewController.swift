//
//  Excersise02ViewController.swift
//  BaiTapView
//
//  Created by tri.nguyen on 30/03/2022.
//

import UIKit

struct UserComponent {
    var name: String?
    var image: UIImage?
}

final class Excersise02ViewController: UIViewController {

    // MARK: - Properties
    
    private var userComponents: [UserComponent] = []
    
    // MARK: - Computed Properties
    
    private lazy var containerView: UIView = {
        let viewSize = CGSize(width: 150, height: 200)
        let view = UIView(frame: CGRect(origin: .zero, size: viewSize))
        view.backgroundColor = .orange
        return view
    }()

    private lazy var userAvatatarImageView: UIImageView = {
        let image = UIImageView()
        image.layer.borderWidth = 2
        image.layer.cornerRadius = 2
        image.contentMode = .scaleToFill
        return image
    }()
    
    private lazy var userNameLabel: UILabel = {
        let username = UILabel()
        username.textColor = .black
        username.textAlignment = .center
        username.backgroundColor = .white
        username.text = "I am here"
        return username
    }()
    
    private lazy var userButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(tapButtonTouchUpInside), for: .touchUpInside)
        return button
    }()
    
    @objc func tapButtonTouchUpInside() {
        
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Private Functions

extension Excersise02ViewController {

    private func setupUI() {
        // TODO: - Remove when have real data
        dummyData()
        configUserComponents()
    }

    private func dummyData() {
        for _ in 0...10 {
            let userImage = UIImage(named: "ic-avatar")
            userComponents.append(.init(name: getRandomName(), image: userImage))
        }
    }

    private func getRandomName() -> String {
        let firstNames = ["Nguyen", "Hoang", "Pham"]
        let lastNames = ["Nam", "Tri", "Kim"]
        let randomFirstName = firstNames[.random(in: 0..<firstNames.count)]
        let randomLastName = lastNames[.random(in: 0..<firstNames.count)]
        let fullname = String(format: "%@ %@", randomFirstName, randomLastName)
        return fullname
    }
    
    private func configUserComponents() {
        // hien tai co 10 doi tuong
        // output can add 10 doi tuong -> view
        // input hien tai userComponents
        for element in userComponents {
            print(element)
        }
        
        userComponents.forEach { component in
            print(component)
            let userView = genUserView(with: component)
            let screenSize = UIScreen.main.bounds.size
            userView.frame.origin = CGPoint(
                x: screenSize.width / 2,
                y: screenSize.height / 2)
            view.addSubview(userView)
        }
    }
    
    private func genUserView(with component: UserComponent) -> UIView {
        let space: CGFloat = 22 // space
        let containerSize = containerView.frame.size
        let widthOfAvatar: CGFloat = containerSize.width - (space * 2)
        let heightOfAvatar = widthOfAvatar // avatar is of ratio 1:1
        let avatarPointX = (containerSize.width / 2) - (widthOfAvatar / 2)
        print("### \(avatarPointX)")
        userAvatatarImageView.frame = CGRect(x: avatarPointX, y: space, width: widthOfAvatar, height: heightOfAvatar)
        
        containerView.addSubview(userAvatatarImageView)
        containerView.addSubview(userNameLabel)
        return containerView
    }
}
