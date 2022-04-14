import UIKit

final class Bai10ViewController: UIViewController, UIScrollViewDelegate {

  
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }

    @IBAction func zoomView(_ sender: Any) {
        let h: CGFloat = view2.bounds.size.height
        let w: CGFloat = view2.bounds.size.width
        view2.frame = CGRect(x: view2.frame.origin.x, y: view2.frame.origin.y, width: w * 2, height: h * 2)
    }
    
}
