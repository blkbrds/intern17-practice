import UIKit
import Foundation
import Darwin
//ex1: Cộng, trừ, nhân, chia phân số
class PhanSo{
    var tuSo: Int
    var mauSo: Int

    init(tuSo: Int, mauSo: Int) {
            self.tuSo = tuSo
            self.mauSo = mauSo
        }

        func cong(phanSo: PhanSo) -> PhanSo {
            let tu = (self.tuSo * phanSo.mauSo) + (phanSo.tuSo * self.mauSo)
            let mau = self.mauSo * phanSo.mauSo
            return PhanSo(tuSo: tu, mauSo:mau)
        }

        func tru(phanSo: PhanSo) -> PhanSo {
            let tu = (self.tuSo * phanSo.mauSo) - (phanSo.tuSo * self.mauSo)
            let mau = self.mauSo * phanSo.mauSo
            return PhanSo(tuSo: tu, mauSo:mau)
        }

        func nhan(phanSo: PhanSo) -> PhanSo {
            let tu = self.tuSo * phanSo.tuSo
            let mau = self.mauSo * phanSo.mauSo
            return PhanSo(tuSo: tu, mauSo: mau)
        }

        func chia(phanSo: PhanSo) -> PhanSo {
            let tu = self.tuSo * phanSo.mauSo
            let mau = self.mauSo * phanSo.tuSo
            return PhanSo(tuSo: tu, mauSo: mau)
        }
    func xuat() -> String {
        return "\(tuSo)/\(mauSo)"
    }
}

var phanso1 = PhanSo(tuSo: 4 , mauSo: 5)
var phanso2 = PhanSo(tuSo: 2, mauSo: 3)

var resultCong = phanso1.cong(phanSo: phanso2)
var resultTru = phanso1.tru(phanSo: phanso2)
var resultNhan = phanso1.nhan(phanSo: phanso2)
var resultChia = phanso1.chia(phanSo: phanso2)

print("Tổng hai phân số =  \(resultCong.xuat())")
print("Hiệu hai phân số = \(resultTru.xuat())")
print("Tích hai phân số = \(resultNhan.xuat())")
print("Thương hai phân số = \(resultChia.xuat())")

//ex2,3,4 xây dựng lớp Đa giác, tam giác

class DaGiac{
    var soCanh: Int = 0
    var a: [Int] = []
    init(canh: Int, a: [Int]){
        guard canh > 2 else {return}
        self.soCanh = canh
        self.a = a

    }
    func cv() -> Int{
        return a.reduce(0, +)
    }
    func toString() -> String{
        var Str = ""
        a.forEach { a in
                    Str += (String(a) + ", ")
                }
                return Str
    }
    func inkq() {
        print("các cạnh \(toString())")
        print("chu vi \(cv())")
    }

}
let rs = DaGiac(canh: 4, a: [10,11,14,16])
rs.inkq()

class TamGiac : DaGiac{
    var chuVi: Int = 0
    init(soCanh: [Int]){
        super.init(canh: 3, a: soCanh)

    }
    override func cv() -> Int {
        super.cv()
    }
    func dienTichTamGiac() -> Double {
        let p = cv() / 2
        let dt = sqrt(Double(p * (p - a[0]) * (a[1]) * (a[2])))
        return dt
    }
    override func inkq() {
        super.inkq()
        print("dien tich tam giac \(dienTichTamGiac())")
    }
}
let a:[Int] = [3,5,7]
let tamGiac = TamGiac(soCanh: a)
tamGiac.inkq()

//ex5 xây dựng lớp CStack
struct CStack {
    private var items: [Int] = []
    
    //kiểm tra stack rỗng
    func isEmty() -> Bool {
        return items.isEmpty
    }
    //kiểm tra stack đầy
    func fullStack(fullElement: Int) -> Bool {
         return items.count >= fullElement - 1 ? true : false

    }
    //thêm
    mutating func push(_ element: Int) {
        items.insert(element, at: 0)
    }
    //xoá
    mutating func removeFirst() -> Int {
        return items.removeFirst()
    }
    
    
}

var nameStack = CStack()
nameStack.isEmty()
nameStack.fullStack(fullElement: 3)
nameStack.push(1)
nameStack.push(2)
nameStack.push(3)
nameStack.push(4)
print(nameStack)

nameStack.removeFirst()
print(nameStack)
//----------------------------------
//ex6: xây dựng lớp tính chu vi diện tích thể tích hình học
let pi = 3.14159265358979323846264338327950288
class Shape {
    func cv() -> Double {
        return 0.0
    }
    
    func dt() -> Double {
        return 0.0
    }
}
class Shape1 {
    func dienTich() -> Double {
        return 0.0
    }
    func theTich() -> Double {
        return 0.0
    }
}
class HinhTron: Shape {
    let r: Double
    init(r: Double) {
        self.r = r
    }
    override func cv() -> Double {
        return 2.0 * pi * r
    }
    override func dt() -> Double {
        return pi * r * r
    }
}
class HinhVuong: Shape {
    let a: Double
    init(a: Double) {
        self.a = a
    }
    override func cv() -> Double {
        return a * 4.0
    }
    override func dt() -> Double {
        return a * a
    }
}
class TamGiac1: Shape {
    let a: Double, b: Double, c: Double
    init(a: Double, b: Double, c: Double) {
        self.a = a
        self.b = b
        self.c = c
    }
    override func cv() -> Double {
        return a + b + c
    }
    override func dt() -> Double {
        let p = cv() / 2
        let S = sqrt(Double(p * (p - a) * (p - b) * (p - c)))
        return S
    }
}
class HinhCau: Shape1 {
    var radius: Double
    init(radius: Double) {
        self.radius = radius
    }
    override func dienTich() -> Double {
        return 4 * pi * radius * radius
    }
    override func theTich() -> Double {
        return (4 / 3) * pi * pow(radius, 3)
    }
}
class HinhLapPhuong: Shape1 {
    var r: Double
    init(r: Double) {
        self.r = r
    }
    override func dienTich() -> Double {
        return 4 * pow(r, 2)
    }
    override func theTich() -> Double {
        return pow(r, 3)
    }
}


let ab = HinhTron(r: 3.0)
print("chu vi hình tròn:\(ab.cv().rounded())")
print("Diện tích hình tròn:",ab.dt().rounded())

let hv = HinhVuong(a: 4.0)
print("chu vi hình vuông:\(hv.cv().rounded())")
print("Diện tích hình vuông:\(hv.dt().rounded())")

let tg = TamGiac1(a: 3.0, b: 5.0, c: 7.0)
print("chu vi tam giác:\(tg.cv().rounded())")
print("Diện tích tam giác:\(tg.dt().rounded())")

let hc = HinhCau(radius: 2.0)
print("Diện tích hình cầu:\(hc.dienTich().rounded())")
print("Thể tích hình cầu:\(hc.theTich().rounded())")

let lp = HinhLapPhuong(r: 4.0)
print("Diện tích lập phương:\(lp.dienTich().rounded())")
print("Thể tích lập phương:\(lp.theTich().rounded())")

//ex7: danh sách học sinh
class Student {
    var hoTen: String
    var namSinh: Int
    var Diem: Float
    
    init(hoTen: String, namSinh: Int, Diem: Float) {
        self.hoTen = hoTen
        self.namSinh = namSinh
        self.Diem = Diem
    }
}
class LiStudent {
    var ds: [Student] = []
    init(ds: [Student]) {
        self.ds = ds
    }
    func list() {
            ds.sort { (st1, st2) -> Bool in
                (st1.Diem, st1.namSinh) > (st2.Diem, st2.namSinh)
            }
        }
        
    func toString() {
            print("Danh sách học sinh sau khi được sắp xếp là: ")
            ds.forEach { print("Tên: \($0.hoTen) - sinh năm \($0.namSinh). Tổng Điểm: \($0.Diem)") }
        }
}
    
let hs1 = Student(hoTen: "Nguyen van A", namSinh: 1991, Diem: 7.0)
let hs2 = Student(hoTen: "Nguyen Van C", namSinh: 1995, Diem: 8.5)
let hs3 = Student(hoTen: "Tran van B", namSinh: 1999, Diem: 6.0)
let hs4 = Student(hoTen: "Nguyen van D", namSinh: 2000, Diem: 9.0)
let student: [Student] = [hs1, hs2, hs3, hs4]
let listSt: LiStudent = LiStudent(ds: student)
listSt.list()
listSt.toString()

//ex9- xây dựng lớp mảng một chiều số nguyên
final class Mang1c {
    var arr: [Int] = []
    init(arr: [Int]) {
        self.arr = arr
    }
    func printArr() {
        for i in 0..<arr.count {
            print(arr[i])
        }
    }
    func maxArr() -> Int {
        var max: Int = 0
        for i in arr {
        if i > max {
            max = i
            }
        }
        return max
        }
            
    func minArr() -> Int {
        var min: Int = 0
        for i in arr {
        if i < min {
            min = i
            }
        }
        return min
        }
}
//ex10:Tinh Tong S=1+2+3+...+n (n nguyên dương)
final class Tong {
    var n: Int = 0
    var S: Int = 0
    
    init(n: Int) {
        self.n = n
    }
    func Sum() -> Int {
        for i in 0...n {
            S += i
        }
        return S
    }
    
}
Tong(n: 5).Sum()



