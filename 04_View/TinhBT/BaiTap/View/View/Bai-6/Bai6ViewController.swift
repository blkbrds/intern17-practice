
import UIKit

class Bai6ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func holdImg(_ sender: UILongPressGestureRecognizer) {
        sender.minimumPressDuration = 5.0
        sender.view?.transform = CGAffineTransform(rotationAngle: 0)
    }
    
    @IBAction func swivelImg(_ sender: UIRotationGestureRecognizer) {
        var lastRotation = CGFloat()
        self.view.bringSubviewToFront(imgView)
        if(sender.state == UIGestureRecognizer.State.ended) {
            lastRotation = 0.0;
        }
        let rotation = 0.0 - (lastRotation - sender.rotation)
        let currentTrans = sender.view?.transform
        let newTrans = currentTrans!.rotated(by: rotation)
        sender.view?.transform = newTrans
        lastRotation = sender.rotation
    }
    
    @IBAction func zoomImg(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            if sender.scale < 2 && sender.scale > 0.5 {
                imgView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
            }
        }
    }
}
