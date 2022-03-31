//
//  BaiTap01ViewController.swift
//  BaiTap01
//
//  Created by tri.nguyen on 24/03/2022.
//

import UIKit

final class BaiTap01ViewController: UIViewController {

    // MARK: - Computed Properties
    private lazy var randomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Random It", for: .normal)
        button.addTarget(self, action: #selector(changeBackgroundAction), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Private Functions

extension BaiTap01ViewController {

    private func setupUI() {
        // 1: Set default background color
        changeBackground(with: .red)
        
        // 2: Config random button
        configRandomButton()
    }

    private func configRandomButton() {
        // Dau tien xac dinh size cua man hinh
        let screenSize = UIScreen.main.bounds.size
        
        // Xac dinh duoc size cua button
        let paddingLeft: CGFloat = 22
        let paddingRight: CGFloat = 22

        // => ScreenWidth - (paddingLeft + paddingRight) => Width
        let buttonWidth = screenSize.width - (paddingLeft + paddingRight)
        let buttonHeight: CGFloat = 44
        let buttonSize = CGSize(width: buttonWidth, height: buttonHeight)
        
        let pointX = screenSize.width / 2
        let pointY = screenSize.height / 2
        
        // Xac dinh vi tri button
        let buttonX = pointX - (buttonWidth / 2)

        // Xac dinh toa do x, y
        let buttonPoint = CGPoint(x: buttonX, y: pointY)

        let randomButtonFrame = CGRect(origin: buttonPoint, size: buttonSize)
        randomButton.frame = randomButtonFrame
        view.addSubview(randomButton)
    }
    
    private func changeBackground(with color: UIColor) {
        view.backgroundColor = color
    }
    
    private func getRandomNumber() -> CGFloat {
        return .random(in: 0...1)
    }

    // Ten cua button + Action
    @objc private func changeBackgroundAction() {
        let targetColor = UIColor(
            red: getRandomNumber(),
            green: getRandomNumber(),
            blue: getRandomNumber(),
            alpha: 1
        )
        
        changeBackground(with: targetColor)
    }
}
