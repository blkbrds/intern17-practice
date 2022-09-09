//
//  DetailViewController.swift
//  DemoExercise
//
//  Created by thuan.nguyen on 28/06/2022.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var typeName: UILabel!
    @IBOutlet private weak var titleName: UILabel!
    @IBOutlet private weak var writenName: UILabel!

    // MARK: propeties
    var image: UIImage?
    var typeN: String = " "
    var titleN: String = " "
    var name: String = " "

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        imageView.image = image
        typeName.text = typeN
        titleName.text = titleN
        writenName.text = name
    }
    private func setupNavigation() {
        title = "DETAIL"
        let leftButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(leftAction))
        navigationItem.leftBarButtonItem = leftButton
    }

    @objc private func leftAction() {
        navigationController?.popViewController(animated: true)
    }
}
