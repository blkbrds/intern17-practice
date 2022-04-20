//
//  Exercise10ViewController.swift
//  AutoLayout
//
//  Created by tri.nguyen on 15/04/2022.
//

import UIKit

final class Exercise10ViewController: UIViewController {
    
    // MARK: - Enum
    enum TapGesture: Int {
        case tapGreen
        case tapPurple
        case tapYellow
        case tapOrange
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var greenView: UIView!
    @IBOutlet private weak var purpleView: UIView!
    @IBOutlet private weak var yellowView: UIView!
    @IBOutlet private weak var orangeView: UIView!
    
    @IBOutlet private weak var greenViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var purpleViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var yellowViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var orangeViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    var maxConstraint: NSLayoutConstraint?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        maxConstraint = greenViewHeightConstraint
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        addTapGesture(greenView, tag: 0)
        addTapGesture(purpleView, tag: 1)
        addTapGesture(yellowView, tag: 2)
        addTapGesture(orangeView, tag: 3)
    }
    
    private func addTapGesture(_ view: UIView, tag: Int) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.tag = tag
        view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Objc
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        guard let view = sender.view,
              let maxConstraint = maxConstraint,
              view.bounds.size.height != maxConstraint.constant else { return }
        
        UIView.animate(withDuration: 1) {
            let tag = view.tag
            let viewType = TapGesture(rawValue: tag)
            let maxHeight = maxConstraint.constant
            self.maxConstraint?.constant = maxHeight / 2
            switch viewType {
            case .tapGreen:
                self.greenViewHeightConstraint.constant = maxHeight
                self.maxConstraint = self.greenViewHeightConstraint
            case .tapPurple:
                self.purpleViewHeightConstraint.constant = maxHeight
                self.maxConstraint = self.purpleViewHeightConstraint
            case .tapYellow:
                self.yellowViewHeightConstraint.constant = maxHeight
                self.maxConstraint = self.yellowViewHeightConstraint
            case .tapOrange:
                self.orangeViewHeightConstraint.constant = maxHeight
                self.maxConstraint = self.orangeViewHeightConstraint
            case .none:
                break
            }
        }
    }
}
