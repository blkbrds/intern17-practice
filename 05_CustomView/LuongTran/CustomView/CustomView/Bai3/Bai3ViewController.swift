//
//  Bai3ViewController.swift
//  CustomView
//
//  Created by luong.tran on 24/08/2022.
//

import UIKit

class Bai3ViewController: UIViewController {

    let nib = Bundle.main.loadNibNamed("CustomButtonView", owner: Bai3ViewController.self, options: nil)?.first as? CustomButtonView

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configNib()
    }

    func configNib(){
        guard let nib = nib else { return }
        nib.center = CGPoint(x: view.frame.size.width / 2, y: view.frame.size.height / 2)
        view.addSubview(nib)
    }

}
