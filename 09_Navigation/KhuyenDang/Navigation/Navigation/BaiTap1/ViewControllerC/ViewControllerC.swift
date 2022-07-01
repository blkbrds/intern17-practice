//
//  ViewControllerC.swift
//  Navigation
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/29/22.
//

import UIKit

final class ViewControllerC: UIViewController {
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewControllerC"
    }
    
    //MARK: - IBActions
    @IBAction private func nextButton(_ sender: Any) {
        let viewD = ViewControllerD()
        navigationController?.pushViewController(viewD, animated: true)
    }
    
    @IBAction private func preButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func rootButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
