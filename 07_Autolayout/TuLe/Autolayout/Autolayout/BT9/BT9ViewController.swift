//
//  BT9ViewController.swift
//  Autolayout
//
//  Created by tu.le2 on 23/06/2022.
//

import UIKit

struct bt9 {
    let image: UIImage?
    let content: String?
}

class BT9ViewController: UIViewController {
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    var randomInt: Int = 0
    
    var abc = [
        bt9(image: UIImage(named: "image1"), content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
        bt9(image: UIImage(named: "image2"), content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting"),
        bt9(image:  UIImage(named: "image3"), content: "Thanks to Free-Article-Spinner.com, search engine dominance can be yours ... for free! "),
        bt9(image:  UIImage(named: "image4"), content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "),
        bt9(image:  UIImage(named: "image5"), content: "f Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, ")
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        randomInt = Int.random(in: 0..<abc.count)
        contentImageView.image = abc[randomInt].image
        contentLabel.text = abc[randomInt].content
    }
    
    @IBAction func previousTouched(_ sender: Any) {
        if randomInt == 0 {
            randomInt = abc.count - 1
        } else {
            randomInt -= 1
        }
        contentImageView.image = abc[randomInt].image
        contentLabel.text = abc[randomInt].content
    }
    
    @IBAction func nextTouched(_ sender: Any) {
        if randomInt == (abc.count - 1) {
            randomInt = 0
        } else {
            randomInt += 1
        }
        contentImageView.image = abc[randomInt].image
        contentLabel.text = abc[randomInt].content
    }
    
}
