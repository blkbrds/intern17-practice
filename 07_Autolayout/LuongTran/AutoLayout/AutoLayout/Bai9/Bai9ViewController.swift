//
//  Bai9ViewController.swift
//  AutoLayout
//
//  Created by luong.tran on 07/09/2022.
//

import UIKit

@IBDesignable class PaddingLabel: UILabel {

    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 7.0
    @IBInspectable var rightInset: CGFloat = 7.0

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
}

final class Bai9ViewController: UIViewController {

    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var btnPrevious: UIButton!
    @IBOutlet private weak var imgPokemon: UIImageView!
    @IBOutlet private weak var btnNext: UIButton!
    @IBOutlet private weak var contentLabel: PaddingLabel!
    @IBOutlet private weak var btnLike: UIButton!
    @IBOutlet private weak var btnComment: UIButton!
    @IBOutlet private weak var btnShare: UIButton!
    
    let arrayImage = ["pok1", "pok2", "pok3", "pok4", "pok5", "pok6", "pok7", "pok8", "pok9", "pok10"]
    let arrayContent = ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."]
    var indexArray = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        checkEnable()
    }

    private func configUI() {
        configLabel()
        configButton()
        configImage()
    }
    
    private func configLabel() {
        contentLabel.layer.borderColor = Define.tintBorderColor
        contentLabel.layer.borderWidth = Define.borderWidth
        contentLabel.text = arrayContent[indexArray]
    }
    
    private func configButton() {
        btnLike.layer.cornerRadius = Define.radius
        btnLike.layer.borderColor = Define.tealBorderColor
        btnLike.layer.borderWidth = Define.borderWidth
        btnComment.layer.cornerRadius = Define.radius
        btnComment.layer.borderColor = Define.tealBorderColor
        btnComment.layer.borderWidth = Define.borderWidth
        btnShare.layer.cornerRadius = Define.radius
        btnShare.layer.borderColor = Define.tealBorderColor
        btnShare.layer.borderWidth = Define.borderWidth
    }
    
    private func configImage() {
        imgPokemon.image = UIImage(named: arrayImage[indexArray])
    }
    
    private func checkEnable() {
        if indexArray == 0 {
            btnPrevious.isEnabled = false
        } else {
            btnPrevious.isEnabled = true
        }
        if indexArray == arrayImage.count - 1 {
            btnNext.isEnabled = false
        } else {
            btnNext.isEnabled = true
        }
    }
    
    @IBAction private func actionPrevious(_ sender: Any) {
        indexArray = indexArray - 1
        numberLabel.text = "\(indexArray + 1) / \(arrayImage.count)"
        imgPokemon.image = UIImage(named: arrayImage[indexArray])
        contentLabel.text = arrayContent.randomElement()
        checkEnable()
    }
    
    @IBAction private func actionNext(_ sender: Any) {
        indexArray = indexArray + 1
        numberLabel.text = "\(indexArray + 1) / \(arrayImage.count)"
        imgPokemon.image = UIImage(named: arrayImage[indexArray])
        contentLabel.text = arrayContent.randomElement()
        checkEnable()
    }
    
}


extension Bai9ViewController {
    private struct Define {
        static var borderWidth: CGFloat = 1.0
        static var radius: CGFloat = 10
        static var tealBorderColor: CGColor = UIColor.systemTeal.cgColor
        static var tintBorderColor: CGColor = UIColor.tintColor.cgColor
    }
}

