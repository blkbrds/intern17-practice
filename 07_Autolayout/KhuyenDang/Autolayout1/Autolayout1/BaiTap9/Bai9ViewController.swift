//
//  Bai9ViewController.swift
//  Autolayout1
//
//  Created by Khuyen Dang T.T. VN.Danang on 6/24/22.
//

import UIKit
struct baiTap9 {
    let image: UIImage?
    let content: String?
}

final class Bai9ViewController: UIViewController {

    @IBOutlet private weak var contentView: UILabel!
    @IBOutlet private weak var contentViewHC: NSLayoutConstraint!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var imageLabel: UILabel!
    @IBOutlet private weak var previousButton: UIButton!
    @IBOutlet private weak var nextButton: UIView!
    
    var index: Int = 0
    var arr = [
        baiTap9(image: UIImage(named: "cat.jpeg"), content: "xxxxxxxxxxxxxx"),
        baiTap9(image: UIImage(named: "mouse.jpeg"), content: "cvĐối với những ai đã làm app iOS chắc đã quen thuộc với cách dựng view bằng autolayout. Qua iOS 9, Apple đã giới thiệu 1 cách dựng view khác, giúp cho việc dựng layout dễ dàng và nhanh chóng hơn. Nó được gọi là Bằng cáccvĐối với những ai đã làm app iOS chắc đã quen thuộc với cách dựng view bằng auv"),
        baiTap9(image: UIImage(named: "dog.jpeg"), content: "xxxxxxxxxxxxxx"),
        baiTap9(image: UIImage(named: "chicken.jpeg"), content: "xcvĐối với những ai đã làm app iOS chắc đã quen thuộc với cách dựng view bằng autolayout. Qua iOS 9, Apple đã giới thiệu 1 cách dựng view khác, giúp cho việc dựng layout dễ dàng và ng... các view chứa bên trong StackView sẽ tự động adjust space tương ứngcvcvĐối với những ai đã làm app iOS chắc đã quen thuộc với cách dựng view bằng autolayout. Qua iOS 9, Apple đã giới thiệu 1 cách dựng view khác, giúp v")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showData(index: index)
    }
    
    private func showData(index: Int) {
        contentView.text = arr[index].content
        imageView.image = arr[index].image
        imageLabel.text = "\(index + 1) / \(arr.count)"
    }
    
    @IBAction private func handleLeftButton(_ sender: Any) {
        if index == 0 { index = 0} else { index -= 1 }
        showData(index: index)
    }
    
    @IBAction private func handleNextButton(_ sender: Any) {
        if index == (arr.count - 1) { index = arr.count - 1 } else { index += 1 }
        showData(index: index)
    }
}
