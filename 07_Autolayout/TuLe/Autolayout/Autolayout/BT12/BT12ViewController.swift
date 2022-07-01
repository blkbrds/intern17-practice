//
//  BT12ViewController.swift
//  Autolayout
import UIKit

final class BT12ViewController: UIViewController {
    
    @IBOutlet private var ButtonCollection: [UIButton]!
    @IBOutlet private weak var stackCollection: UIStackView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        for i in ButtonCollection {
            i.layer.borderWidth = 0.5
        }
        stackCollection.layer.borderWidth = 0.5
    }
}
