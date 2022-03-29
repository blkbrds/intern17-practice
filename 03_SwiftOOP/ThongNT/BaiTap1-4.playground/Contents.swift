import UIKit

// SWIFT OOP //

//----------------------------------//
// Bài tập 1, 2, 3, 4  ß//


// Bài tập 1 //
// Phân số //
struct PhanSo {
    var tuSo: Int
    var mauSo: Int
    
    init?(tuSo: Int, mauSo: Int) {
        guard mauSo != 0 else {
            print("Không thể tạo Phân số")
            return nil
        }
        self.tuSo = tuSo
        self.mauSo = mauSo
    }
    
    func nhan(phanSo: PhanSo) -> PhanSo? {
        let tu = self.tuSo * phanSo.tuSo
        let mau = self.mauSo * phanSo.mauSo
        return PhanSo(tuSo: tu, mauSo: mau)
    }
    
    func chia(phanSo: PhanSo) -> PhanSo? {
        let tu = self.tuSo * phanSo.mauSo
        let mau = self.mauSo * phanSo.tuSo
        return PhanSo(tuSo: tu, mauSo: mau)
    }
    
    func cong(phanSo: PhanSo) -> PhanSo? {
        let tu = (self.tuSo * phanSo.mauSo) + (phanSo.tuSo * self.mauSo)
        let mau = self.mauSo * phanSo.mauSo
        return PhanSo(tuSo: tu, mauSo: mau)
    }
    
    func tru(phanSo: PhanSo) -> PhanSo? {
        let tu = (self.tuSo * phanSo.mauSo) - (phanSo.tuSo * self.mauSo)
        let mau = self.mauSo * phanSo.mauSo
        return PhanSo(tuSo: tu, mauSo: mau)
    }
    
    func cacPhepTinh(with phanSo2: PhanSo) -> String {
        guard let congPs = cong(phanSo: phanSo2),
              let truPs = tru(phanSo: phanSo2),
              let nhanPs = nhan(phanSo: phanSo2),
              let chiaPs = chia(phanSo: phanSo2)
        else { return "Không thể thực hiện phép tính" }
        let str = """
                    ============
                    Cộng: \(congPs.toString())
                    Trừ:  \(truPs.toString())
                    Nhân: \(nhanPs.toString())
                    Chia: \(chiaPs.toString())
                    ============
                    """
        return str
    }
    
    func inKetQua(with phanSo: PhanSo?) {
        guard let phanSo = phanSo else {
            print("Không thể thực hiện phép tính")
            return
        }
        print(cacPhepTinh(with: phanSo))
    }
    
    private func toString() -> String {
        String(tuSo) + "/" + String(mauSo)
    }
}

var ps = PhanSo(tuSo: 1, mauSo: 1)
ps?.inKetQua(with: PhanSo(tuSo: 1, mauSo: 2))


//----------------------------------//
// Bài tập 2 //
// Đa Giác
class DaGiac {
    var soCanh : Int
    var mangKichThuoc: [Int]
    
    init?(soCanh: Int, kichThuoc : [Int]) {
        guard soCanh > 2,
              soCanh == kichThuoc.count else {
            print("Không phải đa giác")
            return nil
        }
        self.soCanh = soCanh
        self.mangKichThuoc = kichThuoc
    }
    
    func tinhChuVi() -> Int {
        return mangKichThuoc.reduce(0, +)
    }
    
    private func toString() -> String {
        var str = ""
        mangKichThuoc.forEach { kichThuoc in
            str += (String(kichThuoc) + ", ")
        }
        return str
    }
    
    func inKetQua() {
        print("Các cạnh của đa giác là:", toString())
        print("Chu vi của đa giác là:", tinhChuVi())
    }
}

//let dg = DaGiac(soCanh: 4, kichThuoc: [1,2,3,4])
//dg?.inKetQua()


//----------------------------------//
// Bài tập 3 //
// class Tam giác thừa kế từ đa giác
final class TamGiac: DaGiac {
    var chuVi: Int = 0
    var values: [Int] = []
    
    init?(cacCanh: [Int]) {
        super.init(soCanh: 3, kichThuoc: cacCanh)
        self.values = cacCanh
    }
    
    func isRightTriangle() -> Bool {
        var temp : Int = 0
        guard let maxValue = values.max() else { return false}
        values = values.filter { $0 != maxValue }
        values.forEach { number in
            temp += number * number
        }
        if temp == maxValue * maxValue {
            return true
        }
        return false
    }
    
    override func tinhChuVi() -> Int {
        super.tinhChuVi()
    }
    
    func tinhDienTich() -> Double {
        let p = tinhChuVi() / 2
        let dienTich = sqrt(Double(p * (p - mangKichThuoc[0]) * (mangKichThuoc[1]) * (mangKichThuoc[2])))
        return dienTich.rounded()
    }
    
    override func inKetQua() {
        super.inKetQua()
        print("Diện tích tam giác là:\(tinhDienTich())")
    }
}

let kichThuoc: [Int] = [3,5,6]
let tamGiac = TamGiac(cacCanh: kichThuoc)
tamGiac?.inKetQua()



//----------------------------------//
// Bài tập 4 //
// Nhập vào các tam giác, xác định tam giác vuông
if let tamGiac1 = TamGiac(cacCanh: [3,4,5]),
   let tamGiac2 = TamGiac(cacCanh: [4,6,5]),
   let tamGiac3 = TamGiac(cacCanh: [7,4,5]),
   let tamGiac4 = TamGiac(cacCanh: [1,1,2]) {
    let mangTamGiac : [TamGiac] = [tamGiac1, tamGiac2, tamGiac3, tamGiac4]
    print("Tam giác vuông gồm: ")
    mangTamGiac.forEach { tamGiac in
        if tamGiac.isRightTriangle() {
            print("\(tamGiac.mangKichThuoc)")
        }
    }
}



