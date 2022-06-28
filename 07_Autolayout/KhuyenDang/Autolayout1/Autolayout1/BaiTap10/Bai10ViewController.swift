//
//  Bai10ViewController.swift
//  Autolayout1
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/24/22.
//

import UIKit

final class Bai10ViewController: UIViewController {

    enum ViewType: Int {
        case green = 0
        case purple = 1
        case yellow = 2
        case red = 3
    }

    @IBOutlet private weak var greenView: UIView!
    @IBOutlet private weak var purpleView: UIView!
    @IBOutlet private weak var yellowView: UIView!
    @IBOutlet private weak var redView: UIView!
    @IBOutlet private weak var greenHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var purpleHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var yellowHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var redHeightConstraint: NSLayoutConstraint!

    var unitHeight: CGFloat {
        let window = UIApplication.shared.windows.first
        let topPadding: CGFloat = window?.safeAreaInsets.top ?? 0
        let bottomPadding: CGFloat = window?.safeAreaInsets.bottom ?? 0
        return (UIScreen.main.bounds.height - topPadding - bottomPadding - 15 * 5) / 5
    }
    
    var currentMaxConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        greenHeightConstraint.constant = unitHeight
        purpleHeightConstraint.constant = unitHeight
        yellowHeightConstraint.constant = unitHeight
        redHeightConstraint.constant = unitHeight * 2
        currentMaxConstraint = redHeightConstraint

        addTagGesture(view: greenView, tag: 0)
        addTagGesture(view: purpleView, tag: 1)
        addTagGesture(view: yellowView, tag: 2)
        addTagGesture(view: redView, tag: 3)
    }

    private func addTagGesture(view: UIView, tag: Int) {
        view.tag = tag
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tap)
    }

    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        guard let view = gesture.view,
              view.bounds.size.height != (unitHeight * 2) else { return }
        let typeView = ViewType( rawValue: view.tag)
        currentMaxConstraint?.constant = unitHeight

        switch typeView {
        case .green:
            greenHeightConstraint.constant = unitHeight * 2
            currentMaxConstraint = greenHeightConstraint
        case .purple:
            purpleHeightConstraint.constant = unitHeight * 2
            currentMaxConstraint = purpleHeightConstraint
        case .yellow:
            yellowHeightConstraint.constant = unitHeight * 2
            currentMaxConstraint = yellowHeightConstraint
        case .red:
            redHeightConstraint.constant = unitHeight * 2
            currentMaxConstraint = redHeightConstraint
        case .none:
            break
        }
    }
}
