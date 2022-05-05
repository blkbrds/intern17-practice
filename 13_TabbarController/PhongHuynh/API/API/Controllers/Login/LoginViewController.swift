import UIKit

class LoginViewController: BaseViewController {
    
    // MARK: - Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - config
    override func setupUI() {
        super.setupUI()
        self.title = "Login"
        updateView()
    }
    
    override func setupData() {
    }
    
    func updateView() {
       
    }

    @IBAction func loginButtonTouchUpInside(_ sender: Any) {
       
    }
    
    

}
