import UIKit

final class Bai9ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet weak var catScrollView: UIScrollView!
    
    // MARK: - Properties
    var index = 0

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = array[index].message
        imageView.image = UIImage(named: array[index].image)
    }

    // MARK: - IBActions
    @IBAction private func rightTouchUpInsinde(_ sender: Any) {
        for index in 0...array.count {
                nameLabel.text = array[index].message
                imageView.image = UIImage(named: array[index].image)
                textLabel.text = "2/5"
                
            
        }
    }
    
    @IBAction func leftTouchUpInside(_ sender: Any) {
        for index in 0..<array.count {
            if index > 0 {
                imageView.image = UIImage(named: array[index].image)
                nameLabel.text = array[index].message
            }
        }
    }
    
    

    
    

}

class Meo {
    var image: String
    var message: String
    
    init(image: String, message: String) {
        self.image = image
        self.message = message
    }
}

let array: [Meo] = [Meo(image: "meo1.jpeg", message: "Cắt, phóng to hoặc thu nhỏ ảnh sẽ không còn là nỗi ám ảnh của bạn nữa vì bài viết này mình sẽ hướng dẫn các bạn cách thực hiện điều đó. Có nhiều cách để resize ảnh nhưng hôm nay mình sẽ hướng dẫn các bạn những cách đơn giản và nhanh chóng nhất trêCắt, phóng to hoặc thu nhỏ ảnh sẽ không còn là nỗi ám ảnh của bạn nữa vì bài viết này mình sẽ hướng dẫn các bạn cách thực hiện điều đó. Có nhiều cách để resize ảnh nhưng hôm nay mình sẽ hướng dẫn các bạn những cách đơn giản và nhanh chóng nhất trê"),
                    Meo(image: "meo2.jpeg", message: "Cắt, phóng to hoặc thu nhỏ ảnh sẽ không còn là nỗi ám ảnh của bạn nữa vì bài viết này mình sẽ hướng dẫn các bạn cách thực hiện điều đó. Có nhiều cách để resize ảnh nhưng hôm nay mình sẽ hướng dẫn các bạn những cách đơn giản và nhanh chóng nhất trê"),
                    Meo(image: "meo3.jpeg", message: "Cắt, phóng to hoặc thu nhỏ ảnh sẽ không còn là nỗi ám ảnh của bạn nữa vì bài viết này mình sẽ hướng dẫn các bạn cách thực hiện điều đó. Có nhiều cách để resize ảnh nhưng hôm nay mình sẽ hướng dẫn các bạn những cách đơn giản và nhanh chóng nhất trêCắt, phóng to hoặc thu nhỏ ảnh sẽ không còn là nỗi ám ảnh của bạn nữa vì bài viết này mình sẽ hướng dẫn các bạn cách thực hiện điều đó. Có nhiều cách để resize ảnh nhưng hôm nay mình sẽ hướng dẫn các bạn những cách đơn giản và nhanh chóng nhất trêCắt, phóng to hoặc thu nhỏ ảnh sẽ không còn là nỗi ám ảnh của bạn nữa vì bài viết này mình sẽ hướng dẫn các bạn cách thực hiện điều đó. Có nhiều cách để resize ảnh nhưng hôm nay mình sẽ hướng dẫn các bạn những cách đơn giản và nhanh chóng nhất trê"),
                    Meo(image: "meo4.jpeg", message: "Cắt, phóng to hoặc thu nhỏ ảnh sẽ không còn là nỗi ám ảnh của bạn nữa vì bài viết này mình sẽ hướng dẫn các bạn cách thực hiện điều đó. Có nhiều cách để resize ảnh nhưng hôm nay mình sẽ hướng dẫn các bạn những cách đơn giản và nhanh chóng nhất trê"),
                    Meo(image: "meo5.jpeg", message: "Cắt, phóng to hoặc thu nhỏ ảnh sẽ không còn là nỗi ám ảnh của bạn nữa vì bài viết này mình sẽ hướng dẫn các bạn cách thực hiện điều đó. Có nhiều cách để resize"),]

