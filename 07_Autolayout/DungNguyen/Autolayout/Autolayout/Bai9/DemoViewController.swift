//
//  DemoViewController.swift
//  Autolayout
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 6/24/22.
//

import UIKit

struct data {
    let image: UIImage?
    let content: String?
}

class DemoViewController: UIViewController {
    
    var index = 0
    var arrContent = [
        data(image: UIImage(named: "cat.jpeg"), content: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."),
        data(image: UIImage(named: "dog.jpeg"), content: "xxxxxxxx"),
        data(image: UIImage(named: "chicken.jpeg"), content: "xxxxxxxx"),
        data(image: UIImage(named: "mouse.jpeg"), content: "xxxxxxxx")
    ]

    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var indexLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showData(index: index)
    }
    
    func showData(index: Int){
        contentLabel.text = arrContent[index].content
        imageView.image = arrContent[index].image
        indexLabel.text = "\(index + 1)/\(arrContent.count)"
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        if index == 0 {
            index = 0
        } else {
            index -= 1
        }
        showData(index: index)
    }
    

    @IBAction func nextButton(_ sender: Any) {
        if index == (arrContent.count - 1) {
            index = arrContent.count - 1
        } else {
            index += 1
        }
        showData(index: index)
    }

}
