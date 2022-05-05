import Foundation

class HomeViewModel {
    var email: String = ""
    var password: String = ""
    
    func fetchData(completion: (Bool, String, String) -> ()) {
        let data = DataManager.shared().read()
        let email = data.0
        let password = data.1
        
        if email != "" || password != "" {
            //lưu trữ dữ liệu
            self.email = email
            self.password = password
            
            //callback
            completion(true, email, password)
        } else {
            //callback
            completion(false, "", "")
        }
    }
}
