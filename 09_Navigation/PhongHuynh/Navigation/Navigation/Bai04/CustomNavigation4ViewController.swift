import UIKit

final class CustomNavigation4ViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        searchBar.placeholder = ""
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchBar)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = cancelButton
    }
}
