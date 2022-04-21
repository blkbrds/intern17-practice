import UIKit

class SelectViewController: UIViewController {

    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var tinhtoanButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Select"
        let leftButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAction))
        navigationItem.leftBarButtonItem = leftButton
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func cancelAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func doneAction() {
        
    }

    @IBAction func clearButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func changeColerButton(_ sender: UIButton) {
        changeColer(tag: sender.tag)
    }
    
    private func changeColer(tag: Int) {
        for button in tinhtoanButton {
            button.backgroundColor = button.tag == tag ? .orange : .white
        }
    }
    
  
}
