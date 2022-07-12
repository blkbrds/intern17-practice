//
//  HomeViewController.swift
//  DemoProtocol
//
//  Created by thuan.nguyen on 20/05/2022.
//

import UIKit

protocol HomeViewControllerDelegate: class {
    func updateController(view: HomeViewController, needsPerform action: HomeViewController.Action)
}

final class HomeViewController: UIViewController {
    
    private var myView = MyView()
    
    enum Action {
        case tap(result: String)
    }
    
    weak var delegate: HomeViewControllerDelegate?
    
    @IBOutlet private weak var loadResultViewButton: UIButton!
    @IBOutlet private weak var number1TextField: UITextField!
    @IBOutlet private weak var number2TextField: UITextField!
    @IBOutlet private weak var resultlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.loadMyView()
        }
    }
    
    private func loadMyView() {
        myView = Bundle.main.loadNibNamed("MyView", owner: self, options: nil)?.first as? MyView ?? myView
        myView.backgroundColor = .red
        myView.delegate = self
        myView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: view.bounds.width, height: 380)
        view.addSubview(myView)
    }

    @IBAction private func LoadView(_ sender: Any) {
        DispatchQueue.main.async {
            if let number1 = self.number1TextField.text, let number2 = self.number2TextField.text {
                self.myView.numberFirst = Int(number1) ?? 0
                self.myView.numberSecond = Int(number2) ?? 0
            }
            self.setupButtonAnimation()
        }
    }
    
    private func setupButtonAnimation() {
        UIView.animate(withDuration: 1, delay: 0.25, usingSpringWithDamping: 5, initialSpringVelocity: 2, options: [.curveEaseIn]) { [unowned self] in
            self.myView.backgroundColor = .systemGray4
            self.myView.frame.origin.y = UIScreen.main.bounds.size.height - 380
            self.myView.layoutIfNeeded()
            self.view.layoutIfNeeded()
        }
    }
}

extension HomeViewController: MyViewDelegate {
    func updateController(view: MyView, needsPerform actions: MyView.Action) {
        switch actions {
        case.tap(let result):
            resultlabel.text = result
            UIView.animate(withDuration: 1, delay: 0.25, usingSpringWithDamping: 5, initialSpringVelocity: 2, options: [.curveEaseIn]) { [unowned self] in
                self.myView.backgroundColor = .systemGray4
                self.myView.frame.origin.y = UIScreen.main.bounds.size.height
                self.myView.layoutIfNeeded()
                self.view.layoutIfNeeded()
            }
        }
    }
}


