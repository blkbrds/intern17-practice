import UIKit

final class SliderViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var redLabel: UILabel!
    @IBOutlet private weak var greenLabel: UILabel!
    @IBOutlet private weak var blueLabel: UILabel!
    
    var redValue: Float = 127 {
        didSet {
            updateUI()
        }
    }
    var blueValue: Float = 127 {
        didSet {
            updateUI()
        }
    }
    var greenValue: Float = 127 {
        didSet {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        colorView.layer.cornerRadius = 40
        redLabel.text = "Red"
        greenLabel.text = "Green"
        blueLabel.text = "Blue"
        titleLabel.text = "Color(R: 127, G: 127, B: 127)"
    }
    
    @IBAction private func redSliderValueChanged(_ sender: UISlider) {
        redValue = Float(Int(sender.value))
    }
    
    @IBAction private func greenSliderValueChanged(_ sender: UISlider) {
        greenValue = Float(Int(sender.value))
    }
    
    @IBAction private func blueSliderValueChanged(_ sender: UISlider) {
        blueValue = Float(Int(sender.value))
    }
    
    private func updateUI() {
        titleLabel.text = "Color(R: \(redValue), \(greenValue), \(blueValue))"
        colorView.backgroundColor = UIColor(red: CGFloat(redValue/255), green: CGFloat(greenValue/255), blue: CGFloat(blueValue/255), alpha: 1)
    }
    
}
