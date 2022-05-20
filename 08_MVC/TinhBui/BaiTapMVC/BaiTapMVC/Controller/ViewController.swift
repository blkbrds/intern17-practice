
import UIKit

final class ViewController: UIViewController {
    
    var so1: Int!
    var so2: Int!
    var dau: String!

    @IBOutlet private weak var ketquaTextField: UITextField!
    
    var caculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func nutBang(_ sender: Any) {
        let so2String = ketquaTextField.text ?? "0"
        so2 = Int(so2String)
        
        var ketqua = 0
            
        if dau == "+" {
            ketqua = caculator.cong(a: so1, b: so2)
        }
        if dau == "-" {
            ketqua = caculator.tru(a: so1, b: so2)
        }
        if dau == "x" {
            ketqua = caculator.nhan(a: so1, b: so2)
        }
        if dau == "/" {
            ketqua = caculator.chia(a: so1, b: so2)
        }
        
        ketquaTextField.text = "\(ketqua)"
    }
    
    @IBAction private func nutCong(_ sender: Any) {
        let so1String = ketquaTextField.text ?? "0"
        so1 = Int(so1String)
        
        ketquaTextField.text = ""
        dau = "+"
    }

    @IBAction private func nutTru(_ sender: Any) {
        let so1String = ketquaTextField.text ?? "0"
        so1 = Int(so1String)
        
        ketquaTextField.text = ""
        dau = "-"
    }
    
    @IBAction private func nutNhan(_ sender: Any) {
        let so1String = ketquaTextField.text ?? "0"
        so1 = Int(so1String)
        
        ketquaTextField.text = ""
        dau = "x"
    }
    
    @IBAction private func nutChia(_ sender: Any) {
        let so1String = ketquaTextField.text ?? "0"
        so1 = Int(so1String)
        
        ketquaTextField.text = ""
        dau = "/"
    }
    
    @IBAction private func nutXoa(_ sender: Any) {
        ketquaTextField.text = ""
    }
    
    @IBAction private func nut0(_ sender: Any) {
        var kq: String = ketquaTextField.text ?? ""
        kq += "0"
        
        ketquaTextField.text = kq
    }
    
    @IBAction private func nut1(_ sender: Any) {
        var kq: String = ketquaTextField.text ?? ""
        kq += "1"
        
        ketquaTextField.text = kq
    }
    
    @IBAction private func nut2(_ sender: Any) {
        var kq: String = ketquaTextField.text ?? ""
        kq += "2"
        
        ketquaTextField.text = kq
    }
    
    @IBAction private func nut3(_ sender: Any) {
        var kq: String = ketquaTextField.text ?? ""
        kq += "3"
        
        ketquaTextField.text = kq
    }
    
    @IBAction private func nut4(_ sender: Any) {
        var kq: String = ketquaTextField.text ?? ""
        kq += "4"
        
        ketquaTextField.text = kq
    }
    
    @IBAction private func nut5(_ sender: Any) {
        var kq: String = ketquaTextField.text ?? ""
        kq += "5"
        
        ketquaTextField.text = kq
    }
    
    @IBAction private func nut6(_ sender: Any) {
        var kq: String = ketquaTextField.text ?? ""
        kq += "6"
        
        ketquaTextField.text = kq
    }
    
    @IBAction private func nut7(_ sender: Any) {
        var kq: String = ketquaTextField.text ?? ""
        kq += "7"
        
        ketquaTextField.text = kq
    }
    
    @IBAction private func nut8(_ sender: Any) {
        var kq: String = ketquaTextField.text ?? ""
        kq += "8"
        
        ketquaTextField.text = kq
    }
    
    @IBAction private func nut9(_ sender: Any) {
        var kq: String = ketquaTextField.text ?? ""
        kq += "9"
        
        ketquaTextField.text = kq
    }
}
