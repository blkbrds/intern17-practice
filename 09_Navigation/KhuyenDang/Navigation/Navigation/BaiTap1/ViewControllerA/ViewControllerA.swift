//
//  ViewControllerA.swift
//  Navigation
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/29/22.
//

import UIKit

class ViewControllerA: UIViewController {
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewControllerA"
    }
    
    //MARK: - IBAction
    @IBAction private func nextButton(_ sender: Any) {
        let viewB = ViewControllerB()
        navigationController?.pushViewController(viewB, animated: true)
    }
}
