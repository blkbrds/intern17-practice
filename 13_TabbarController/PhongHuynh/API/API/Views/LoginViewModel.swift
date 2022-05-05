import Foundation

final class LoginViewModel {
    
    // MARK: - enum
    enum LoginResult {
        case success
        case failure(Bool, String)
    }
    
    // MARK: - typealias
    typealias Completion = (LoginResult) -> Void
    
    // MARK: - Properties
    var email: String = "ví dụ cho email"
    var password: String = "ví dụ cho mật khẩu"
    
    init(email: String, password: String) {
            self.email = email
            self.password = password
    }
    
    // MARK: - Actions
    func login(email: String, password: String, completion: Completion) {
        if email == "" || password == "" {
            //callback
            completion(.failure(true, "Mật khẩu hoặc email rỗng."))
        } else {
            //cập nhật dữ liệu
            self.email = ""
            self.password = ""
            
            //save data
            DataManager.shared().save(email: email, password: password)
            
            //callback
            completion(.success)
        }
    }
    
}
