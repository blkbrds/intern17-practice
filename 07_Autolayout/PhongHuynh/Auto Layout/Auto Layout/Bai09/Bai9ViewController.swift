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
        if catScrollView.contentOffset.x < self.view.bounds.width * CGFloat(array.count-2) {
            catScrollView.contentOffset.x +=  self.view.bounds.width
            index += 1
            imageView.image = UIImage(named: array[index].image)
            nameLabel.text = array[index].message
            textLabel.text = "\(index + 1)/5"
            
        }
    }
    
    @IBAction func leftTouchUpInside(_ sender: Any) {
        if catScrollView.contentOffset.x > 0 {
            catScrollView.contentOffset.x -=  self.view.bounds.width
            imageView.image = UIImage(named: array[index - 1].image)
            nameLabel.text = array[index - 1].message
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
                    Meo(image: "meo4.jpeg", message: "Cắt, phóng to hoặc thu nhỏ ảnh sẽ không còn là nỗi ám ảnh của bạn nữa vì bài viết này mình sẽ hướng dẫn các bạn cách thực hiện điều đó. Có nhiều cách để resize ảnh nhưng hôm nanh sẽ không còn là nỗi ám ảnh của bạn nữa vì bài viết này mình sẽ hướng dẫn các bạn cách thực hiện điều đó. Có nhiều cách để resize ảnh nhưng hôm nay mình sẽ hướng dẫn các bạn những cách đơn giản và nhanh chóng nhất trêCắt, phóng to hoặc thu nhỏ ảnh sẽ không còn là nỗi ám ảnh của bạn nữa vì bài viết này mình sẽ hướng dẫn các bạn cách thực hiện điều đó. Có nhiều cách để resize ảnh nhưng hôm nay mình sẽ hướng dẫn các bạn những cách đơn giản và nhanh chóng nhất trêy mình sẽ hướng dẫn các bạn những cách đơn giản và nhanh chóng nhất trê"),
                    Meo(image: "meo5.jpeg", message: "Cắt, phóng to hoặc thu nhỏ ảnh sẽ không còn là nỗi ám ảnh của bạn nữa vì bài viết này mình sẽ hướng dẫn các bạn cách thực hiện điều đó. Có nhiều cnh sẽ không còn là nỗi ám ảnh của bạn nữa vì bài viết này mình sẽ hướng dẫn các bạn cách thực hiện điều đó. Có nhiều cách để resize ảnh nhưng hôm nay mình sẽ hướng dẫn các bạn những cách đơn giản và nhanh chóng nhất trêCắt, phóng to hoặc thu nhỏ ảnh sẽ không còn là nỗi ám ảnh của bạn nữa vì bài viết này mình sẽ hướng dẫn các bạn cách thực hiện điều đó. Có nhiều cách để resize ảnh nhưng hôm nay mình sẽ hướng dẫn các bạn những cách đơn giản và nhanh chóng nhất trênh sẽ không còn là nỗi ám ảnh của bạn nữa vì bài viết này mình sẽ hướng dẫn các bạn cách thực hiện điều đó. Có nhiều cách để resize ảnh nhưng hôm nay mình sẽ hướng dẫn các bạn những cách đơn giản và nhanh chóng nhất trêCắt, phóng to hoặc thu nhỏ ảnh sẽ không còn là nỗi ám ảnh của bạn nữa vì bài viết này mình sẽ hướng dẫn các bạn cách thực hiện điều đó. Có nhiều cách để resize ảnh nhưng hôm nay mình sẽ hướng dẫn các bạn những cách đơn giản và nhanh chóng nhất trêách để resize"),]

