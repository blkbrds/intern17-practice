import UIKit

//MARK: -BAI TAP 1
class PhanSo {
    //MARK: prototype
    var tuSo: Int
    var mauSo: Int
    init(tuSo: Int, mauSo: Int) {
        self.tuSo = tuSo
        self.mauSo = mauSo
    }
    //MARK: function
    func congHaiPhanSo(_ phanSo1: PhanSo, _ phanSo2: PhanSo) -> PhanSo? {
        if phanSo1.mauSo != 0 && phanSo2.mauSo != 0 {
            self.tuSo = phanSo1.tuSo * phanSo2.mauSo + phanSo2.tuSo * phanSo1.mauSo
            self.mauSo = phanSo1.mauSo * phanSo2.mauSo
            return PhanSo(tuSo: self.tuSo , mauSo: self.mauSo)
        }
        return nil
    }
    
    func truHaiPhanSo(_ phanSo1: PhanSo, _ phanSo2: PhanSo) -> PhanSo? {
        if phanSo1.mauSo != 0 && phanSo2.mauSo != 0 {
            self.tuSo = phanSo1.tuSo * phanSo2.mauSo - phanSo2.tuSo * phanSo1.mauSo
            self.mauSo = phanSo1.mauSo * phanSo2.mauSo
            return PhanSo(tuSo: self.tuSo , mauSo: self.mauSo)
        }
        return nil
    }
    
    func nhanHaiPhanSo(_ phanSo1: PhanSo, _ phanSo2: PhanSo) -> PhanSo? {
        if phanSo1.mauSo != 0 && phanSo2.mauSo != 0 {
            self.tuSo = phanSo1.tuSo * phanSo2.tuSo
            self.mauSo = phanSo1.mauSo * phanSo2.mauSo
            return PhanSo(tuSo: self.tuSo , mauSo: self.mauSo)
        }
        return nil
    }
    
    func chiaHaiPhanSo(_ phanSo1: PhanSo, _ phanSo2: PhanSo) -> PhanSo? {
        if phanSo1.mauSo != 0 && phanSo2.mauSo != 0 {
            self.tuSo = phanSo1.tuSo * phanSo2.mauSo
            self.mauSo = phanSo1.mauSo * phanSo2.tuSo
            return PhanSo(tuSo: self.tuSo , mauSo: self.mauSo)
        }
        return nil
    }
    
    func inPhanSo() -> String {
        print(tuSo, "/", mauSo)
        return "\(tuSo) / \(mauSo)"
    }
    
    func uSCLN(phanSo: PhanSo) -> Int {
        var a = abs(phanSo.tuSo)
        var b = abs(phanSo.mauSo)
        if b != 0 {
            if (a == 0) {
                return a + b
            }
            while (a != b)
            {
                if a > b {
                    a = a - b
                } else {
                    b = b - a
                }
            }
        }
        return a
    }
    
    func rutGonPhanSo(phanSo: PhanSo) -> PhanSo {
        let a = uSCLN(phanSo: phanSo)
        return PhanSo(tuSo: phanSo.tuSo / a, mauSo: phanSo.mauSo / a)
    }
    
    func dinhGiaTri(phanSo: PhanSo) -> Float {
        var result: Float = 0
        result = Float(phanSo.tuSo) / Float(phanSo.mauSo)
        return result
        
    }
    func test(phanSo1: PhanSo, phanSo2: PhanSo){
        guard let tong = congHaiPhanSo(phanSo1, phanSo2) else {
            print("phan so co mau = 0 la phan so khong xac dinh")
            return
        }
        print("tong 2 phan so = " + rutGonPhanSo(phanSo: tong).inPhanSo())
        
        guard  let hieu = truHaiPhanSo(phanSo1, phanSo2)
        else {
            print("phan so co mau = 0 la phan so khong xac dinh")
            return
        }
        print("hieu 2 phan so = " + rutGonPhanSo(phanSo: hieu).inPhanSo())
        
        guard  let tich = nhanHaiPhanSo(phanSo1, phanSo2)
        else {
            print("phan so co mau = 0 la phan so khong xac dinh")
            return
        }
        print("tich 2 phan so = " + rutGonPhanSo(phanSo: tich).inPhanSo())
        
        guard  let thuong = chiaHaiPhanSo(phanSo1, phanSo2)
        else {
            print("phan so co mau = 0 la phan so khong xac dinh")
            return
        }
        print("tich 2 phan so = " + rutGonPhanSo(phanSo: thuong).inPhanSo())
    }
}
var phanSo = PhanSo.init(tuSo: 1, mauSo: 1)

phanSo.test(phanSo1: PhanSo(tuSo: 1, mauSo: 2), phanSo2: PhanSo(tuSo: 3, mauSo: 4))



