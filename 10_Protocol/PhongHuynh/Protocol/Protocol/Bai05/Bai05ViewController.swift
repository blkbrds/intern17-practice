import UIKit

protocol SelectViewDatasource {
    
    func setXY() -> (x: String, y: String)
}

class Bai05ViewController: UIViewController {

    

    var dataSource: SelectViewDatasource?
    
    @IBOutlet weak var xTextField: UITextField!
    @IBOutlet weak var yTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let x = dataSource?.setXY() else { return }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }

    @IBAction func push(_ sender: Any) {
        let selectView = Bundle.main.loadNibNamed("SelectView", owner: self, options: nil)?.first as? SelectView
        selectView?.frame = CGRect(x: 0, y: view.bounds.maxY - (view.bounds.height/3), width: view.bounds.width, height: view.bounds.height / 3)
        view.addSubview(selectView!)
    }
    
}

extension Bai05ViewController: SelectViewControllerDelegate {
    func setXY(view: SelectViewController, needsPerfom actions: SelectViewController.Action) {
        switch actions {
        case .tap(let x, let y):
            xTextField.text = x
            yTextField.text = y
        }
    }
    
    
}
