import UIKit


class PhanSo{
    var tu: Int
    var mau: Int
    
    init(tu: Int, mau: Int){
        self.tu = tu
        self.mau = mau
    }
    
    func CheckPhanSo(phanSo: PhanSo) -> Bool {
        guard (mau != 0 && phanSo.mau != 0) else{
            print("Mẫu không được bằng 0")
            return false
        }
        return true
    }
    
    func congPhanSo(phanSo: PhanSo){
        if CheckPhanSo(phanSo: phanSo) == true {
            let tuSo = tu * phanSo.mau + mau * phanSo.tu
            let mauSo = phanSo.mau*mau
            let result = Float(tuSo)/Float(mauSo)
            print("Cong: \(result)")
        }
        
    }
    
    func truPhanSo(phanSo: PhanSo){
        if CheckPhanSo(phanSo: phanSo) == true {
            let tuSo = tu * phanSo.mau - mau * phanSo.tu
            let mauSo = phanSo.mau*mau
            let result = Float(tuSo)/Float(mauSo)
            print("Tru: \(result)")
        }
    }
    
    func nhanPhanSo(phanSo: PhanSo){
        if CheckPhanSo(phanSo: phanSo) == true {
            let tuSo = tu * phanSo.tu
            let mauSo = mau * phanSo.mau
            let result = Float(tuSo)/Float(mauSo)
            print("Nhan: \(result)")
        }
    }
    
    func chiaPhanSo(phanSo: PhanSo){
        if CheckPhanSo(phanSo: phanSo) == true {
            let tuSo = tu * phanSo.mau
            let mauSo = mau * phanSo.tu
            let result = Float(tuSo)/Float(mauSo)
            print("Chia: \(result)")
        }
    }
}


let test: PhanSo = PhanSo(tu: 3, mau: 4)
test.congPhanSo(phanSo: PhanSo(tu: 5, mau: 2))
test.truPhanSo(phanSo: PhanSo(tu: 5, mau: 2))
test.nhanPhanSo(phanSo: PhanSo(tu: 5, mau: 2))
test.chiaPhanSo(phanSo: PhanSo(tu: 5, mau: 0))







