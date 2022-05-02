import Cocoa

var str = "Hello, playground"

//bai 6

class HinhHoc {

    func dienTich() -> Float {
        return 0
    }
    
    func chuVi() -> Float {
        return 0
    }
}

class HaiChieu: HinhHoc {
    
    func toString() -> String {
        return ""
    }
}

class BaChieu: HinhHoc {
    
    func theTich() -> Float {
        return 0
    }
    
    func toString() -> String {
        return ""
    }
}

class HinhTron: HaiChieu {
    
    var r: Float
    
    init(r: Float) {
        self.r = r
    }
    
    override func dienTich() -> Float {
        return Float.pi * r * r
    }
    
    override func chuVi() -> Float {
        return 2 * r * Float.pi
    }
    
    override func toString() -> String {
        return "Diện tích hình tròn là: \(dienTich()), chu vi hình tròn: \(chuVi())"
    }
}

let ht = HinhTron(r: 3)
print(ht.toString())

class HinhVuong: HaiChieu {
    
    var a: Float = 0
    
    override func dienTich() -> Float {
        return a * a
    }
    
    override func chuVi() -> Float {
        return a * 4
    }
    
    override func toString() -> String {
        return "Diện tích hình vuông là: \(dienTich()), Chu vi hình vuông là: \(chuVi())"
    }
}

class TamGiac: HaiChieu {
    
    var a: Float
    var b: Float
    var c: Float
    
    init(a: Float, b: Float, c: Float) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    override func chuVi() -> Float {
        return a + b + c
    }
    
    override func dienTich() -> Float {
        let p = chuVi() / 2
        return sqrt(p * (p - a) * (p - b) * (p - c))
    }
    
    override func toString() -> String {
        return "Diện tích hình tam giác là: \(dienTich()), Chu vi hình tam giác là: \(chuVi())"
    }
}

let tg = TamGiac(a: 2, b: 3, c: 4)
print(tg.toString())

class HinhCau: BaChieu {
    
    var r: Float
    
    init(r: Float) {
        self.r = r
    }
     
    override func dienTich() -> Float {
        return 4 * Float.pi * r * r
    }
    
    override func theTich() -> Float {
        return (4 * Float.pi * r * r * r) / 3
    }
    
    override func toString() -> String {
        return " Diện tích hình cầu là: \(dienTich()), Thể tích hình cầu là: \(theTich())"
    }
}

class LapPhuong: BaChieu {
    
    var a: Float

    init(a: Float) {
        self.a = a
    }
    
    override func chuVi() -> Float {
        return 12 * a
    }
    
    override func dienTich() -> Float {
        return a * a * 6
    }
    
    override func theTich() -> Float {
        return a * a * a
    }
    
    override func toString() -> String {
        return "Thể tích lập phương là: \(chuVi()), Diện tích lập phươnglà: \(dienTich()), Thể tích lập phương là: \(theTich())"
    }
}

let hc = HinhCau(r: 4)
let lp = LapPhuong(a: 6)
print(lp.toString())
 
//bai 7

class HocSinh {
    
    var hoTen: String
    var namSinh: Int
    var tongDiem: Float
    
    init(hoTen: String, namSinh: Int, tongDiem: Float) {
        self.hoTen = hoTen
        self.namSinh = namSinh
        self.tongDiem = tongDiem
    }
}

class DanhSachHs  {
    
    var ds = [HocSinh]()
    
    init(ds: [HocSinh]) {
        self.ds = ds
    }
    
    func sapXep() -> [HocSinh] {
        ds.sort { (hs1: HocSinh, hs2: HocSinh) -> Bool in
            if hs1.tongDiem > hs2.tongDiem {
                return true
            } else if hs1.tongDiem == hs2.tongDiem {
                return hs1.namSinh > hs2.namSinh
            } else {
                return false
            }
        }
        for i in ds {
            i.hoTen = i.hoTen.capitalized
        }
        return ds
    }
    
    func inKetQua(ds: [HocSinh]) -> String {
         var kq = ""
         for hs in ds {
             kq += hs.hoTen + "\(hs.tongDiem)" + "\n"
         }
         return kq
     }
}

var hs1 = HocSinh(hoTen: "bui van a ", namSinh: 2000, tongDiem: 8.0)
var hs2 = HocSinh(hoTen: "bui van c ", namSinh: 2000, tongDiem: 9.0)
var hs3 = HocSinh(hoTen: "bui van d ", namSinh: 1999, tongDiem: 7.0)
var hs4 = HocSinh(hoTen: "bui van b ", namSinh: 1999, tongDiem: 10.0)
var hs5 = HocSinh(hoTen: "bui van e ", namSinh: 1997, tongDiem: 10.0)
var ds = DanhSachHs(ds: [hs1, hs2, hs3, hs4, hs5])
print("danh sach hoc sinh da sap xep")
print(ds.inKetQua(ds: ds.sapXep()))


//bai 8

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
         switch month {
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
    
    func check() -> Bool {
        if year < 1 || year > 9999 || month < 1 || month > 12 || day < 1 || day > 31 {
            return false
        } else if day > daysIn() {
            return false
        }
     return true
    }
    
    func printDate() {
           print("\(day)/\(month)/\(year)")
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
        print("ngày tiếp theo")
        printDate()
    }
}

var date = Date(day: 31, month: 12, year: 2016)
if date.check() {
    date.printDate()
    date.advance()
} else {
    print("nhập ngày sai")
}

// bai` tâp 9

struct Mang {
    
    var arr: [Int]
      
    init(arr: [Int]) {
        self.arr = arr
    }
      
    func xuatMang() {
        for i in 0..<arr.count {
            print("phần tử a[\(i)] = \(arr[i])")
        }
    }
      
    func ptLonNhat() -> Int {
        var max: Int = 0
        for i in 0..<arr.count {
            if (arr[i] > max) {
                max = arr[i]
            }
        }
        return max
    }
      
    func ptNhoNhat() -> Int {
        var min: Int = arr[0]
        for i in 1..<arr.count {
            if (arr[i] < min) {
                min = arr[i]
            }
        }
        return min
    }
}

let a = Mang(arr: [2, 3, 4, 5, 7, 8, 8])
a.xuatMang()
print("phần tử lớn nhất trong mảng là: \(a.ptLonNhat())")
print("phần tử nhỏ nhất trong mảng là: \(a.ptNhoNhat())")

// bai` 10
 
struct A {
    
    var n: Int
    var s: Int = 0
    
    init(n: Int) {
        self.n = n
    }
    
    mutating func tinhTong() -> Int {
        for i in 1...n {
            s = s + i
        }
        return s
    }
}

var test = A(n: 5)
print("tong cuar day so la: \(test.tinhTong())")


