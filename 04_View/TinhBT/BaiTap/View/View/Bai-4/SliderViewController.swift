
import UIKit

class SliderViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var bluSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var viewBackground: UIView!
    
    var color: Color!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        color = Color(red: redSlider.value, green: greenSlider.value, blue: bluSlider.value)
        displayLabel.text = color.getString()
        viewBackground.backgroundColor = color.getColor()
    }
    
    @IBAction func sliderChange(_ sender: UISlider) {
        if (sender.tag == 1) {
            color.setRed(red: sender.value)
            displayLabel.text = color.getString()
            viewBackground.backgroundColor = color.getColor()
        } else if (sender.tag == 2) {
            color.setGreen(green: sender.value)
            displayLabel.text = color.getString()
            viewBackground.backgroundColor = color.getColor()
        } else if (sender.tag == 3) {
            color.setBlue(blue: sender.value)
            displayLabel.text = color.getString()
            viewBackground.backgroundColor = color.getColor()
        }
    }
}
