//
//  Ex9ViewController.swift
//  AutoLayout
//
//  Created by thuan.nguyen on 06/05/2022.
//

import UIKit
class Picture {
    var image: String
    var message: String
    init(image: String, message: String){
        self.image = image
        self.message = message
    }
}
final class Ex9ViewController: UIViewController {
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    var index: Int = 0 {
        didSet {
            setupUI(index: index)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI(index: index)
        
    }
    
    private func setupUI(index: Int) {
        imageView.image = UIImage(named: Config().pictures[index].image)
        descriptionLabel.text = Config().pictures[index].message
        numberLabel.text = "\(index + 1)/\(Config().pictures.count)"
    }
    @IBAction func backTouch(_ sender: Any) {
        if index > 0 {
            index -= 1
        }
    }
    @IBAction func nextTouch(_ sender: Any) {
        if index < Config().pictures.count - 1 {
            index += 1
        }
    }
}

extension Ex9ViewController {
    struct Config {
        let pictures: [Picture] = [
            Picture(image: "meo1", message: "Mèo (chính xác hơn là loài mèo nhà để phân biệt với các loài trong họ Mèo khác) là động vật có vú, nhỏ nhắn và chuyên ăn thịt, sống chung với loài người, được nuôi để săn vật gây hại hoặc làm thú nuôi cùng với chó nhà. Mèo nhà đã sống gần gũi với loài người ít nhất 9.500 năm,[4] và hiện nay chúng là con vật cưng phổ biến nhất trên thế giới."),
            Picture(image: "meo2", message: "Mèo Anh hiện là loài mèo được nuôi phổ biến tại nhiều gia đình trên thế giới trong đó có Việt Nam. Mèo Anh được phân chia thành 2 loại là mèo Anh lông ngắn (British Shorthair) và mèo Anh lông dài (British Longhair). Những chú mèo Anh thuộc hai giống này đều sở hữu ngoại hình vô cùng dễ thương, vì thế được rất nhiều người yêu thích. "),
            Picture(image: "meo3", message: "Lý lịch của mèo Anh khá là phức tạp vì chúng bị chia thành 2 giống khác nhau. Mèo Anh lông ngắn còn có tên gọi là mèo Aln, loài mèo có lịch sử lâu đời nhất nước Anh. Chào đời nhờ sự phối kết hợp ngẫu nhiên của giống mèo Ai Cập cổ đại và những chú mèo đường phố ở Anh."),
            Picture(image: "meo4", message: "Mèo Anh hiện là loài mèo được nuôi phổ biến tại nhiều gia đình trên thế giới trong đó có Việt Nam. Mèo Anh được phân chia thành 2 loại là mèo Anh lông ngắn (British Shorthair) và mèo Anh lông dài (British Longhair). Những chú mèo Anh thuộc hai giống này đều sở hữu ngoại hình vô cùng dễ thương, vì thế được rất nhiều người yêu thích.Mèo Anh hiện là loài mèo được nuôi phổ biến tại nhiều gia đình trên thế giới trong đó có Việt Nam. Mèo Anh được phân chia thành 2 loại là mèo Anh lông ngắn (British Shorthair) và mèo Anh lông dài (British Longhair). Những chú mèo Anh thuộc hai giống này đều sở hữu ngoại hình vô cùng dễ thương, vì thế được rất nhiều người yêu thích. Mèo Anh hiện là loài mèo được nuôi phổ biến tại nhiều gia đình trên thế giới trong đó có Việt Nam. Mèo Anh được phân chia thành 2 loại là mèo Anh lông ngắn (British Shorthair) và mèo Anh lông dài (British Longhair).   "),
            Picture(image: "meo5", message: "Mèo (chính xác hơn là loài mèo nhà để phân biệt với các loài trong họ Mèo khác) là động vật có vú, nhỏ nhắn và chuyên ăn thịt, sống chung với loài người, được nuôi để săn vật gây hại hoặc làm thú nuôi cùng với chó nhà. Mèo nhà đã sống gần gũi với loài người ít nhất 9.500 năm,[4] và hiện nay chúng là con vật cưng phổ biến nhất trên thế giới."),
            Picture(image: "meo6", message: "Lý lịch của mèo Anh khá là phức tạp vì chúng bị chia thành 2 giống khác nhau. Mèo Anh lông ngắn còn có tên gọi là mèo Aln, loài mèo có lịch sử lâu đời nhất nước Anh. Chào đời nhờ sự phối kết hợp ngẫu nhiên của giống mèo Ai Cập cổ đại và những chú mèo đường phố ở Anh.")
            
        ]
        
        
    }
}
