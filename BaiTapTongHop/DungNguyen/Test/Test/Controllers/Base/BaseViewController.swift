//
//  BaseViewController.swift
//  Test
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/20/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Functions
    func setupUI() {
        self.navigationItem.backBarButtonItem =  UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    
    func setupData() {
    }
}
