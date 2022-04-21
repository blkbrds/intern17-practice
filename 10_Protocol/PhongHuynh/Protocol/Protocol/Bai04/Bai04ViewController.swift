import UIKit


final class Bai04ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var txtTextView: UITextView!
    
    // MARK: - Properties
    var resultArray:[String] = []
    let array: [String] = ["Hoà Bình", "Sơn La", "Điện Bàn", "Lai Châu", "Lào Cai", "Yên Bái", "Phú Thọ", "Hà Giang", "Tuyên Quang", "Cao Bằng", "Bắc Cạn", "Thái Nguyên", "Lạng Sơn", "Bắc Giang", "Quảng Ninh", "Hà Nội", "Bắc Ninh", "Hà Nam", "Hải Dương", "Hải Phòng", "Hưng Yên", "Nam Định", "Thái Bình", "Vĩnh Phúc", "Ninh Bình", "Thanh Hoá"]
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showTextView()
        searchBar.delegate = self
    }
    
    // MARK: - IBActions
    @IBAction func resetButton(_ sender: Any) {
        showTextView()
    }
    
    // MARK: - Private functions
    private func showTextView() {
        var text: String = ""
        for i in array {
            text += "- \(i)\n"
        }
        txtTextView.text = text
    }
}

// MARK: - UISearchBarDelegate
extension Bai04ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            resultArray = array
        } else {
            resultArray = array.filter({ (city) -> Bool in
                return city.contains(searchText.lowercased())
            })
        }
        var text: String = ""
        for i in resultArray {
            text += "- \(i)\n"
        }
        txtTextView.text = text
    }
}
