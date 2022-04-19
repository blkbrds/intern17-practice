import UIKit

final class Bai6ViewController: UIViewController {
    
    // MARK: - IBOutlets 
    @IBOutlet weak private var monkeyImage: UIImageView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

// MARK: - Private functions
private func setupUI() {
    let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(regconizer:)))
    let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate(regconizer:)))
    let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(regconizer:)))
    monkeyImage.isUserInteractionEnabled = true
    monkeyImage.addGestureRecognizer(pinchGesture)
    monkeyImage.addGestureRecognizer(rotateGesture)
    monkeyImage.addGestureRecognizer(longPressGesture)
}

// MARK: - Objc functions
@objc func handlePinch(regconizer: UIPinchGestureRecognizer) {
    guard let view = regconizer.view, regconizer.scale >= 0.5 && regconizer.scale <= 2.0 else { return }
    view.transform = view.transform.scaledBy(x: regconizer.scale, y: regconizer.scale)
}

// MARK: - Objc functions
@objc func handleRotate(regconizer: UIRotationGestureRecognizer) {
    guard let view = regconizer.view else { return }
    view.transform = view.transform.rotated(by: regconizer.rotation)
    regconizer.rotation = 0
}

// MARK: - Objc functions
@objc func handleLongPress(regconizer: UILongPressGestureRecognizer) {
    guard let view = regconizer.view else { return }
    UIView.animate(withDuration: 5.0) {
    view.transform = view.transform.scaledBy(x: 1.0, y: 1.0)
    view.transform = CGAffineTransform(rotationAngle: 0)
    }
}
}
