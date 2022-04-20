import UIKit

final class MyViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var helloLabel: UILabel!

    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add button
        view.backgroundColor = .green
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.backgroundColor = .black
        button.setTitle("Tap", for: .normal)
        button.center = view.center
        button.addTarget(self, action: #selector(buttonDidClick), for: .touchUpInside)
        view.addSubview(button)
    }
        
    // MARK: - Objc functions
    @objc func buttonDidClick() {
        view.backgroundColor = UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
