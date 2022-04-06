//
//  MyAvatarView.swift
//  CustomView
//
//  Created by tri.nguyen on 06/04/2022.
//

import UIKit

protocol MyAvatarDelegate {
    func didTap(view: MyAvatarView, name: String)
}

class MyAvatarView: UIView {
    
    // MARK: - Properties
    
    var name: String? {
        didSet {
            setupUI()
        }
    }
    
    var avatar: String? {
        didSet {
            setupUI()
        }
    }
    
    var delegate: MyAvatarDelegate?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    // MARK: - IBActions
    
    @IBAction func myButtonTouchUpInside(_ sender: Any) {
        if let delegate = delegate {
            delegate.didTap(view: self, name: name ?? "")
        }
    }
    
    // MARK: - Private Functions
    
    private func setupUI() {
        nameLabel.text = name
        guard avatarImageView.image == UIImage(named: avatar ?? "") else { return }
    }
}
