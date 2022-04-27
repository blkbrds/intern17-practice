import UIKit

//MARK: -BAI TAP 1
class PhanSo {
    //MARK: prototype
    var tuso: Int
    var mauso: Int
    init(tuso: Int, mauso: Int) {
        self.tuso = tuso
        self.mauso = mauso
    }
    //MARK: function
    func congHaiPhanSo(_ phanSo1: PhanSo, _ phanSo2: PhanSo) -> PhanSo? {
        if phanSo1.mauso != 0 && phanSo2.mauso != 0 {
            self.tuso = phanSo1.tuso * phanSo2.mauso + phanSo2.tuso * phanSo1.mauso
            self.mauso = phanSo1.mauso * phanSo2.mauso
            return PhanSo(tuso: self.tuso , mauso: self.mauso)
        }
        return nil
    }
    
    func truHaiPhanSo(_ phanSo1: PhanSo, _ phanSo2: PhanSo) -> PhanSo? {
        if phanSo1.mauso != 0 && phanSo2.mauso != 0 {
            self.tuso = phanSo1.tuso * phanSo2.mauso - phanSo2.tuso * phanSo1.mauso
            self.mauso = phanSo1.mauso * phanSo2.mauso
            return PhanSo(tuso: self.tuso , mauso: self.mauso)
        }
        return nil
    }
    
    func nhanHaiPhanSo(_ phanSo1: PhanSo, _ phanSo2: PhanSo) -> PhanSo? {
        if phanSo1.mauso != 0 && phanSo2.mauso != 0 {
            self.tuso = phanSo1.tuso * phanSo2.tuso
            self.mauso = phanSo1.mauso * phanSo2.mauso
            return PhanSo(tuso: self.tuso , mauso: self.mauso)
        }
        return nil
    }
    
    func chiaHaiPhanSo(_ phanSo1: PhanSo, _ phanSo2: PhanSo) -> PhanSo? {
        if phanSo1.mauso != 0 && phanSo2.mauso != 0 {
            self.tuso = phanSo1.tuso * phanSo2.mauso
            self.mauso = phanSo1.mauso * phanSo2.tuso
            return PhanSo(tuso: self.tuso , mauso: self.mauso)
        }
        return nil
    }
    
    func inPhanSo() -> String {
        print(tuso, "/", mauso)
        return "\(tuso) / \(mauso)"
    }
    
    func uSCLN(phanSo: PhanSo) -> Int {
        var a = abs(phanSo.tuso)
        var b = abs(phanSo.mauso)
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
        return PhanSo(tuso: phanSo.tuso / a, mauso: phanSo.mauso / a)
    }
    
    func dinhGiaTri(phanSo: PhanSo) -> Float {
        var result: Float = 0
        result = Float(phanSo.tuso) / Float(phanSo.mauso)
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
var phanso = PhanSo.init(tuso: 1, mauso: 1)

phanso.test(phanSo1: PhanSo(tuso: 1, mauso: 2), phanSo2: PhanSo(tuso: 3, mauso: 4))



