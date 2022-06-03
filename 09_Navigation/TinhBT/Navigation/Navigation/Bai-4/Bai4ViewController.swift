
import UIKit

final class Bai4ViewController: UIViewController {

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Feed"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor.brown
        creteButton()
    }
    
    // MARK: - Private functions
    private func creteButton() {
        let leftBarButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(search))
        navigationItem.leftBarButtonItem = leftBarButton
        
        let personButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
        personButton.addTarget(self, action: #selector(person), for: .touchUpInside)
        personButton.setImage(UIImage(named: "icons8"), for: .normal)
        let rightBarButton = UIBarButtonItem(customView: personButton)
        navigationItem.rightBarButtonItem = rightBarButton
    }

    // MARK: - Objc functions
    @objc private func search() {
        print("timmmmm kim")
    }
    
    @objc private func person() {
        print("ta ra")
    }
}
