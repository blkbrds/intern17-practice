import UIKit

final class Bai7ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak private var monkeyImage: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

// MARK: - Private functions
private func setupUI() {
    let oneTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleOneTapGesture(recognizer:)))
    oneTapGesture.numberOfTapsRequired = 1
    let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTapGesture(recognizer:)))
    doubleTapGesture.numberOfTapsRequired = 2
    monkeyImage.isUserInteractionEnabled = true
    monkeyImage.addGestureRecognizer(oneTapGesture)
    monkeyImage.addGestureRecognizer(doubleTapGesture)
    nameLabel.clipsToBounds = true
    nameLabel.layer.borderColor = UIColor.black.cgColor
    nameLabel.backgroundColor = .systemBlue
    nameLabel.isHidden = true
}

// MARK: - Objc functions
@objc func handleOneTapGesture(recognizer: UITapGestureRecognizer) {
    guard recognizer.view != nil else { return }
    nameLabel.alpha = 1
    nameLabel.text = "I am monkey"
    nameLabel.isHidden = false
    Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
        UIView.animate(withDuration: 5.0) {
            self.nameLabel.alpha = 0
        }
    }
}

// MARK: - Objc functions
@objc func handleDoubleTapGesture(recognizer: UITapGestureRecognizer) {
    guard recognizer.view != nil else { return }
    nameLabel.alpha = 1
    nameLabel.text = "Monkey is me"
    nameLabel.isHidden = false
    Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
        UIView.animate(withDuration: 5.0) {
            self.nameLabel.alpha = 0
        }
    }
}
    
}
