import UIKit

final class BT4ViewController: UIViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var listTextView: UITextView!
    
    var searchActive : Bool = false
    let listProvince: [String] = ["Hoà Bình", "Sơn La", "Điện Biên", "Lai Châu", "Yên Bái", "Phú Thọ", "Hà Giang", "Tuyên Quang", "Cao Bằng", "Phú Thọ"]
    var data: [String] = []
    var i = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        createContentTextView()
    }
    func createContentTextView() {
        var str: String = ""
        for i in listProvince {
            str += "- \(i)\n"
            listTextView.text = str
        }
    }
}

extension BT4ViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var str: String = ""
        for i in listProvince {
            if i.contains(searchText) {
                str += "- \(i)\n"
            }
        }
        listTextView.text = str
        if searchText.isEmpty {
            createContentTextView()
        }
    }
}
