import UIKit

// Bai tap 1
class PhanSo {
    var tuSo: Int
    var mauSo: Int
    
    init(tuSo: Int, mauSo: Int) {
        self.tuSo = tuSo
        self.mauSo = mauSo
    }
     
    func cong(phanSo: PhanSo) -> PhanSo {
        let tu = tuSo * phanSo.mauSo + mauSo * phanSo.tuSo
        let mau = mauSo * phanSo.mauSo
        return PhanSo(tuSo: tu, mauSo: mau)
    }
    
    func tru(phanSo: PhanSo) -> PhanSo {
        let tu = tuSo * phanSo.mauSo - mauSo * phanSo.tuSo
        let mau = mauSo * phanSo.mauSo
        return PhanSo(tuSo: tu, mauSo: mau)
    }
    
    func nhan(phanSo: PhanSo) -> PhanSo {
        let tu = tuSo * phanSo.tuSo
        let mau = mauSo * phanSo.mauSo
        return PhanSo(tuSo: tu, mauSo: mau)
    }
    
    func chia(phanSo: PhanSo) -> PhanSo {
        let tu = tuSo * phanSo.mauSo
        let mau = mauSo * phanSo.tuSo
        return PhanSo(tuSo: tu, mauSo: mau)
    }
    
    func inPhanSo() -> String {
        return "\(tuSo) / \(mauSo)"
    }
}

var phanSo1 = PhanSo(tuSo: 3, mauSo: 4)
var phanSo2 = PhanSo(tuSo: 2, mauSo: 5)

var ketQuaCong = phanSo1.cong(phanSo: phanSo2)
var ketQuaTru = phanSo1.tru(phanSo: phanSo2)
var ketQuaNhan = phanSo1.nhan(phanSo: phanSo2)
var ketQuaChia = phanSo1.chia(phanSo: phanSo2)

print("Tổng của hai phân số = \(ketQuaCong.inPhanSo())")
print("Hiệu của hai phân số = \(ketQuaTru.inPhanSo())")
print("Tích của hai phân số = \(ketQuaNhan.inPhanSo())")
print("Thương của hai phân số = \(ketQuaChia.inPhanSo())")

// Bai tap 2
class DaGiac {
    var soCanh: Int = 0
    var a: [Int]
    
    init(soCanh: Int, a: [Int]) {
        //guard soCanh > 2 else {return}
        self.soCanh = soCanh
        self.a = a
    }
    
    func tinhChuVi() -> Int {
        var cv = 0
        for i in 0..<self.soCanh {
            cv += self.a[i]
        }
        return cv
    }
    
    func inKetQua() {
        for i in 0..<self.soCanh {
            print("Canh thu \(i + 1) : \(self.a[i])")
        }
        print("Chu vi = \(tinhChuVi())")
    }
}

let daGiac = DaGiac(soCanh: 3, a: [2, 5, 4])
//daGiac.inKQ()

// Bai tap 3 va bai tap 4
class TamGiac: DaGiac {
    
    override init(soCanh: Int = 3, a: [Int]){
        super.init(soCanh: soCanh, a: a)
    }
    
    override func tinhChuVi() -> Int {
        super.tinhChuVi()
    }
    
    func tinhDienTich() -> Double {
        let p: Float = Float(tinhChuVi() / 2)
        let a: Float = p * ( p - Float(super.a[0])) * ( p - Float(super.a[1]) ) * ( p - Float(super.a[2]))
        return Double(Float((sqrt(a))))
    }
    
    func checkTamGiacPytago() -> String {
        return pow(Decimal((a[0])), 2) + pow(Decimal((a[1])), 2) == pow(Decimal(a[2]), 2) ? "Thoa man dinh ly Pytago" : "khong thoa dinh ly Pytago"
    }

    override func inKetQua() {
        print("Chu vi tam giac = \(tinhChuVi())")
        print("Dien tich tam giac = \(tinhDienTich())")
    }
}

let tamGiac = TamGiac(a: [3 , 4, 5])
tamGiac.inKetQua()
print("\(tamGiac.checkTamGiacPytago())")

// Bai tap 5
class CStack {
    var stack: [Int]
    let size: Int = 5
    var index: Int
    
    init(stack: [Int]) {
        self.stack = stack
        self.index = stack.count
    }
    
    func isEmpty() -> Bool {
        return index == 0
    }
    
    func isFull() -> Bool {
        return index == size
    }
    
    func push(item: Int) {
        if isFull() {
            print("Ngan xep day")
            return
        }
        index += 1
        stack.append(item)
    }
    
    func pop() {
        if isEmpty() {
            print("Ngan xep rong")
        }
        stack.popLast()
        index -= 1
    }
}

let stack = CStack(stack: [10, 2, 5, 7 , 9])
stack.isEmpty()
stack.isFull()
stack.push(item: 2)
stack.pop()

// Bai tap 6
class HinhVe {
    func dienTich() -> Float {
        return 0.0
    }
    
    func chuVi() -> Float {
        return 0.0
    }
    
    func theTich() -> Float {
        return 0.0
    }
}

class HaiChieu: HinhVe {
    override func dienTich() -> Float {
        super.dienTich()
    }
    
    override func chuVi() -> Float {
        super.chuVi()
    }
    
    func inKetQua() {
        print("Dien tich \(dienTich())")
        print("Chu tich \(chuVi())")
    }
}

class BaChieu: HinhVe {
    override func dienTich() -> Float {
        super.dienTich()
    }
    
    override func chuVi() -> Float {
        super.chuVi()
    }
    
    override func theTich() -> Float {
        super.theTich()
    }
    
    func inKetQua() {
        print("Dien tich \(dienTich())")
        print("The tich \(theTich())")
    }
}

class Tron: HaiChieu {
    var r: Float
    
    init(r : Float) {
        self.r = r
    }
    
    override func dienTich() -> Float {
        return r * r * Float.pi
    }
    
    override func chuVi() -> Float {
        return 2 * r * Float.pi
    }
    
    override func inKetQua() {
        super.inKetQua()
    }
}

class Vuong: HaiChieu {
    var a: Float
    
    init(a: Float) {
        self.a = a
    }
    
    override func dienTich() -> Float {
        return a * a
    }
    
    override func chuVi() -> Float {
        return  4 * a
    }
    
    override func inKetQua() {
        super.inKetQua()
    }
}

class HinhTamGiac: HaiChieu {
    var a: Float
    var b: Float
    var c: Float
    
    init(a: Float, b: Float, c: Float) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    override func dienTich() -> Float {
        let p = 1 / 2 * (a + b + c)
        let x = p * (p - a) * (p - b) * (p - c)
        return sqrt(x)
    }
    
    override func chuVi() -> Float {
        return a + b + c
    }
    
    override func inKetQua() {
        super.inKetQua()
    }
}

class HinhCau: BaChieu {
    var r: Float
    
    init(r : Float) {
        self.r = r
    }
    
    override func dienTich() -> Float {
        return 4 * Float.pi * r * r
    }
    
    override func theTich() -> Float {
        return 4/3 * Float.pi * r * r * r
    }
    
    override func inKetQua() {
        super.inKetQua()
    }
}

class LapPhuong: BaChieu {
    var a: Float
    
    init(a: Float) {
        self.a = a
    }
    
    override func dienTich() -> Float {
        return 6 * a * a
    }
    
    override func theTich() -> Float {
        return a * a * a
    }
    
    override func chuVi() -> Float {
        return 12 * a
    }
    
    override func inKetQua() {
        super.inKetQua()
        print("Chu tich \(chuVi())")
    }
}

let ketQua = LapPhuong(a: 2)
ketQua.inKetQua()

// Bai tap 7
class HocSinh {
    var hoTen: String
    var namSinh: Int
    var tongDiem: Double
    
    init(hoTen: String, namSinh: Int, tongDiem: Double) {
        self.hoTen = hoTen
        self.namSinh = namSinh
        self.tongDiem = tongDiem
    }
    
    func toString() -> String {
        return "Ho Ten: \(hoTen), Nam Sinh: \(namSinh), Tong Diem: \(tongDiem)"
    }
}
 
class DanhSachHocSinh {
    var danhSach: [HocSinh]
    
    init(danhSach: [HocSinh]) {
        self.danhSach = danhSach
    }
    
    func sapXep() -> [HocSinh] {
        danhSach.sort { (hs1: HocSinh, hs2: HocSinh) -> Bool in
            if hs1.tongDiem > hs2.tongDiem {
                return true
            } else if hs1.tongDiem == hs2.tongDiem {
                return hs1.namSinh < hs2.namSinh
            }
            return false
        }
        
        for hocSinh in danhSach {
            hocSinh.hoTen = hocSinh.hoTen.capitalized
        }
        
        return danhSach
    }
    
    func inKetQua() {
        var kq = ""
        for hs in danhSach {
            kq += hs.hoTen + " \(hs.tongDiem)" + " \(hs.namSinh)" + "\n"
        }
        print(kq)
    }
}
 
var hs1 = HocSinh(hoTen: "Nguyen thi thuy dung", namSinh: 1999, tongDiem: 8.0)
var hs2 = HocSinh(hoTen: "nguyen van binh", namSinh: 2000, tongDiem: 9.0)
var hs3 = HocSinh(hoTen: "nguyen van a", namSinh: 2001, tongDiem: 8.0)
var hs4 = HocSinh(hoTen: "nguyen van b", namSinh: 1998, tongDiem: 10.0)
var hs5 = HocSinh(hoTen: "tran cao van", namSinh: 1997, tongDiem: 10.0)
var danhSach = DanhSachHocSinh(danhSach: [hs1, hs2, hs3, hs4, hs5])
danhSach.sapXep()
danhSach.inKetQua()
 
// Bai tap 8
class Date {
    var day: Int
    var month: Int
    var year: Int
 
    init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
 
    func daysIn() -> Int {
        var dayIn = 31
        switch self.month {
        case 2:
            if (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0) {
                dayIn = 29
            } else {
                dayIn = 28
            }
        case 4, 6, 9, 11:
            dayIn = 30
        default:
            dayIn = 31
        }
        return dayIn
    }
 
    func normalize() {
        guard day < daysIn() else {
            return self.day = 18
        }
 
        guard month < 12 else {
            return self.month = 9
        }
 
        guard year > 1 else {
            return self.year = 1997
        }
    }
 
    func printDate() {
        print("\(day)-\(month)-\(year)")
    }
 
    func advance() {
       day += 1
        if day > daysIn() {
            day = 1
            month += 1
            if month > 12 {
                month = 1
                year += 1
            }
        }
    }
}
 
var date = Date(day: 31, month: 6, year: 2022)
date.advance()
date.printDate()
date.normalize()

// Bai tap 9
class Mang1c {
    var arr: [Int] = []
    
    init(arr: [Int]) {
        self.arr = arr
    }
    
    func printArr() {
        for i in arr {
            print(i)
        }
    }
    
    func printMax() {
        var max = arr[0]
        for i in arr {
            if max < i {
                max = i
            }
        }
        print(max)
    }
    
    func printMin() {
        var min = arr[0]
        for i in arr {
            if min > i {
                min = i
            }
        }
        print(min)
    }
}

let array = Mang1c(arr: [2, 3, 4])
//array.printArr()
//array.printMax()
//array.printMin()

// Bai tap 10
class A {
    var n: Int
    var s: Int = 0
    
    init(n: Int) {
        self.n = n
    }
    
    func tongA() -> Int {
        for i in 0...n {
            s += i
        }
        return s
    }
}

let tong = A(n: 4)
print(tong.tongA())
