import UIKit



class Bai05ViewController: UIViewController {
    
    @IBOutlet weak var xTextField: UITextField!
    @IBOutlet weak var yTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Select"
        let leftButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAction))
        navigationItem.leftBarButtonItem = leftButton
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))
        navigationItem.rightBarButtonItem = rightButton
        
        
    }

    @IBAction func push(_ sender: Any) {
        let selectView = Bundle.main.loadNibNamed("SelectView", owner: self, options: nil)?.first as? SelectView
        selectView?.frame = CGRect(x: 0, y: view.bounds.maxY - (view.bounds.height/3), width: view.bounds.width, height: view.bounds.height / 3)
        selectView?.dataSource = self
        view.addSubview(selectView!)
        
    }
    
    @objc func cancelAction() {
        
    }
    
    @objc func doneAction() {
    }
    

}

extension Bai05ViewController: SelectViewDatasource {
    func setXY() -> (x: String, y: String) {
        guard let x = xTextField.text, let y = yTextField.text else {
            return ("0", "0")
        }
        return (x,y)
    }
}

extension Bai05ViewController: SelectViewDelegate {
    func backResult(view: SelectView, needsPerfom actions: SelectView.Action) {
        switch actions {
        case .tap(let result):
            resultLabel.text = result
        }
    }
    
}
