//
//  ViewControllerB.swift
//  Navigation
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/29/22.
//

import UIKit

class ViewControllerB: UIViewController {
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewControllerB"
    }
    
    //MARK: - IBActions
    @IBAction private func preButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func nextButton(_ sender: Any) {
        let viewC = ViewControllerC()
        navigationController?.pushViewController(viewC, animated: true)
    }
}
