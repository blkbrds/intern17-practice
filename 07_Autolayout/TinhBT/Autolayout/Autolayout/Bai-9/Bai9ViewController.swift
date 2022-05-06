
import UIKit

class Bai9ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var inforLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inforLabel.text = array[index].message
        imageView.image = UIImage(named: array[index].image)
    }
   
 
    @IBAction private func rightTouchUpInsinde(_ sender: Any) {
        guard index < array.count - 1 else { return }
        index += 1
        imageView.image = UIImage(named: array[index].image)
        inforLabel.text = array[index].message
        textLabel.text = "\(index + 1)/8"
    }

    @IBAction private func leftTouchUpInside(_ sender: Any) {
        guard index > 0 else { return }
        index -= 1
        imageView.image = UIImage(named: array[index].image)
        inforLabel.text = array[index].message
        textLabel.text = "\(index + 1)/8"
    }
    
}
class Cat {
    var image: String
    var message: String
    
    init(image: String, message: String) {
        self.image = image
        self.message = message
    }
}
let array: [Cat] = [Cat(image: "cats", message: "m Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survmake a typeince the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesm Ipsum is simply dummy text of the"),
                    Cat(image: "cat", message: "m Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survmake a typeince the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesm Ipsum is simply dummy text of the"),
                    Cat(image: "cats", message: "m Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survmake a typeince the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesm Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has bestry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to vived not only five centuries, but also the leap into electronic"),
                    Cat(image: "cat", message: "m Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survmake a typeince the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesm Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has bestry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to vived not only five centuries, but also the leap into electronic"),
                    Cat(image: "cats", message: "m Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survmake a typeince the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesm Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has bestry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to vived not only five centuries, but also the leap into electronic typesm Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's stry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesm Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has bestry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to ce the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic types"),
                    Cat(image: "cat", message: "m Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survmake a typeince the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesm Ipsum is simply dummy text of the"),
                    Cat(image: "cats", message: "m Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survmake a typeince the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesm Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has bestry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to vived not only five centuries, but also the leap into electronic"),
                    Cat(image: "cat", message: "m Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survmake a typeince the 1500s, when an unknown printer took a galley m Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survmake a typeince the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesm Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has bestry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to vived not only five centuries, but also the leap into electronicm Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survmake a typeince the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesm Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has bestry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to vived not only five centuries, but also the leap into electronicm Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survmake a typeince the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesm Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has bestry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to vived not only five centuries, but also the leap into electronicof type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesm Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has bestry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to vived not only five centuries, but also the leap into electronic"),]
