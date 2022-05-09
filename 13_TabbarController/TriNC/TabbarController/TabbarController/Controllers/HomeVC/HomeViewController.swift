//
//  HomeViewController.swift
//  TabbarController
//
//  Created by tri.nguyen on 09/05/2022.
//

import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var emailLabel: UILabel!
    
    // MARK: - Properties
    private var homeViewModel = HomeViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UI
    override func setupUI() {
        title = "Home"
    }
    
    // MARK: - Data
    override func setupData() {
        homeViewModel.fetchData { (done, email, password) in
            if done {
                self.updateUI()
            } else {
                print("Error")
            }
        }
    }
    
    // MARK: - Function
    func updateUI() {
        emailLabel.text = homeViewModel.email
    }
}
