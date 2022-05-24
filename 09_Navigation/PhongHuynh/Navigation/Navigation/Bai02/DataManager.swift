import Foundation

class DataManager {
    static func checkData(userName: String, password: String) -> Bool {
        if let path = Bundle.main.path(forResource: "data", ofType: "plist"),
           let myDict = NSDictionary(contentsOfFile: path) {
            for dict in myDict {
                if dict.key as! String == userName {
                    return dict.value as! String == password
                }
            }
        }
        return false
    }
}
