
import UIKit

final class SliderViewController: UIViewController {
    
    @IBOutlet private weak var displayLabel: UILabel!
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var bluSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var viewBackground: UIView!
    
    var color: Color!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        color = Color(red: redSlider.value, green: greenSlider.value, blue: bluSlider.value)
        displayLabel.text = color.getString()
        viewBackground.backgroundColor = color.getColor()
    }
    
    @IBAction private func sliderChange(_ sender: UISlider) {
        if sender.tag == 1 {
            color.setRed(red: sender.value)
            displayLabel.text = color.getString()
            viewBackground.backgroundColor = color.getColor()
        } else if sender.tag == 2 {
            color.setGreen(green: sender.value)
            displayLabel.text = color.getString()
            viewBackground.backgroundColor = color.getColor()
        } else if sender.tag == 3 {
            color.setBlue(blue: sender.value)
            displayLabel.text = color.getString()
            viewBackground.backgroundColor = color.getColor()
        }
    }
}
