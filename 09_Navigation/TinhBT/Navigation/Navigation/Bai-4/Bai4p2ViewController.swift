

import UIKit

final class Bai4p2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightButton = UIBarButtonItem(title: "Right", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightButton
        
        let mid1Button = UIBarButtonItem(title: "Mid 1", style: .plain, target: self, action: nil)
        let mid2Button = UIBarButtonItem(title: "Mid 2", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItems = [mid1Button, mid2Button]
        navigationItem.leftItemsSupplementBackButton = true
        
          let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
          navigationItem.backBarButtonItem = backButton
        
    }



}
