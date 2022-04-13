import UIKit

class Bai10ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view4: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollview = UIScrollView.init(frame: self.view.bounds)
        scrollview.minimumZoomScale = 0.1
        scrollview.maximumZoomScale = 0.4
       // scrollView.zoomScale = 1.0
        scrollview.delegate = self
   //     scrollview.addSubview(view1)
   
    }

    @IBAction func zoomView(_ sender: Any) {
        
    }
    
}
