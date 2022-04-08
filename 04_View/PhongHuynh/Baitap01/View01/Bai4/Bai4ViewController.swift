import UIKit

final class Bai4ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak private var redSlider: UISlider!
    @IBOutlet weak private var greenSlider: UISlider!
    @IBOutlet weak private var blueSlider: UISlider!
    @IBOutlet weak private var colorView: UIView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.value = 50
        greenSlider.value = 50
        blueSlider.value = 100
    }
    
    @IBAction private func moveRedSlider(_ sender: Any) {
        changeSlider(r: redSlider.value, g: greenSlider.value, b: blueSlider.value)
    }
    
    func changeSlider(r: Float, g: Float, b: Float) {
        titleLabel.text = "Color(R: \(Int(r)), G: \(Int(g)), B: \(Int(b))"
        colorView.backgroundColor = UIColor(
            red: CGFloat(r / 255),
            green: CGFloat(g / 255),
            blue: CGFloat(b / 255),
            alpha: 1.0
        )
    }
}
