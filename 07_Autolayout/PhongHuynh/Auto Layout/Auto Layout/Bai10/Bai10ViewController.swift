import UIKit

final class Bai10ViewController: UIViewController, UIScrollViewDelegate {

    // MARK: - IBOutlets
    @IBOutlet private weak var view1: UIView!
    @IBOutlet private weak var view2: UIView!
    @IBOutlet private weak var view3: UIView!
    @IBOutlet private weak var view4: UIView!
    @IBOutlet private weak var greenViewConstraint: NSLayoutConstraint!
    @IBOutlet private weak var pupleViewConstraint: NSLayoutConstraint!
    @IBOutlet private weak var yellowViewConstraint: NSLayoutConstraint!
    @IBOutlet private weak var redViewConstraint: NSLayoutConstraint!
    @IBOutlet private weak var greenViewScale: NSLayoutConstraint!
    @IBOutlet private weak var pupleViewScale: NSLayoutConstraint!
    @IBOutlet private weak var yellowViewScale: NSLayoutConstraint!
    @IBOutlet private weak var redViewScale: NSLayoutConstraint!

    let width: CGFloat = 220
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions
    @IBAction private func clickGreenViewTouchUpInside(_ sender: Any) {
        greenViewScale.priority = UILayoutPriority(rawValue: 250)
        greenViewConstraint.priority = UILayoutPriority(rawValue: 750)
        greenViewConstraint.constant = width + (width / 3)
        pupleViewScale.priority = UILayoutPriority(rawValue: 250)
        pupleViewConstraint.priority = UILayoutPriority(rawValue: 750)
        pupleViewConstraint.constant = width - (width / 3)
        yellowViewScale.priority = UILayoutPriority(rawValue: 250)
        yellowViewConstraint.priority = UILayoutPriority(rawValue: 750)
        yellowViewConstraint.constant = width - (width / 3)
        redViewScale.priority = UILayoutPriority(rawValue: 250)
        redViewConstraint.priority = UILayoutPriority(rawValue: 750)
        redViewConstraint.constant = width - (width / 3)
    }
    
    // MARK: - IBActions
    @IBAction private func clickPupleViewTouchUpInside(_ sender: Any) {
        greenViewScale.priority = UILayoutPriority(rawValue: 250)
        greenViewConstraint.priority = UILayoutPriority(rawValue: 750)
        greenViewConstraint.constant = width - (width / 3)
        pupleViewScale.priority = UILayoutPriority(rawValue: 250)
        pupleViewConstraint.priority = UILayoutPriority(rawValue: 750)
        pupleViewConstraint.constant = width + (width / 3)
        yellowViewScale.priority = UILayoutPriority(rawValue: 250)
        yellowViewConstraint.priority = UILayoutPriority(rawValue: 750)
        yellowViewConstraint.constant = width - (width / 3)
        redViewScale.priority = UILayoutPriority(rawValue: 250)
        redViewConstraint.priority = UILayoutPriority(rawValue: 750)
        redViewConstraint.constant = width - (width / 3)
    }
    
    // MARK: - IBActions
    @IBAction private func clickYellowViewTouchUpInside(_ sender: Any) {
        greenViewScale.priority = UILayoutPriority(rawValue: 250)
        greenViewConstraint.priority = UILayoutPriority(rawValue: 750)
        greenViewConstraint.constant = width - (width / 3)
        pupleViewScale.priority = UILayoutPriority(rawValue: 250)
        pupleViewConstraint.priority = UILayoutPriority(rawValue: 750)
        pupleViewConstraint.constant = width - (width / 3)
        yellowViewScale.priority = UILayoutPriority(rawValue: 250)
        yellowViewConstraint.priority = UILayoutPriority(rawValue: 750)
        yellowViewConstraint.constant = width + (width / 3)
        redViewScale.priority = UILayoutPriority(rawValue: 250)
        redViewConstraint.priority = UILayoutPriority(rawValue: 750)
        redViewConstraint.constant = width - (width / 3)
    }
    
    // MARK: - IBActions
    @IBAction private func clickRedViewTouchUpInside(_ sender: Any) {
        greenViewScale.priority = UILayoutPriority(rawValue: 250)
        greenViewConstraint.priority = UILayoutPriority(rawValue: 750)
        greenViewConstraint.constant = width - (width / 3)
        pupleViewScale.priority = UILayoutPriority(rawValue: 250)
        pupleViewConstraint.priority = UILayoutPriority(rawValue: 750)
        pupleViewConstraint.constant = width - (width / 3)
        yellowViewScale.priority = UILayoutPriority(rawValue: 250)
        yellowViewConstraint.priority = UILayoutPriority(rawValue: 750)
        yellowViewConstraint.constant = width - (width / 3)
        redViewScale.priority = UILayoutPriority(rawValue: 250)
        redViewConstraint.priority = UILayoutPriority(rawValue: 750)
        redViewConstraint.constant = width + (width / 3)
    }
    
}
