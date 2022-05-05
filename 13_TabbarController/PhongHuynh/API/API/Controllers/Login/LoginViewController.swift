import UIKit

class LoginViewController: BaseViewController {
    
    // MARK: - Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var viewModel = LoginViewModel(email: "email nè", password: "mật khẩu nè")
    
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
        emailTextField.text = viewModel.email
        passwordTextField.text = viewModel.password
    }

    @IBAction func loginButtonTouchUpInside(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        // tao gia tri cho closure
        let complete: LoginViewModel.Completion = { (result) in
            switch result {
            case .success:
                //làm cái gi đó
                print("ĐĂNG NHẬP THÀNH CÔNG")
                self.updateView()
                //thay đổi root
                let scene = UIApplication.shared.connectedScenes.first
                if let sd : SceneDelegate = (scene?.delegate as? SceneDelegate) {
                    sd.changeScreen(type: .tabbar)
                }
            case .failure(let isError, let errorMsg):
                if isError {
                    print("ĐĂNG NHẬP THẤT BẠI")
                    print(errorMsg)
                }
            }
        }
        
        // goi ham
        viewModel.login(email: email, password: password, completion: complete)
    }
    
    

}
