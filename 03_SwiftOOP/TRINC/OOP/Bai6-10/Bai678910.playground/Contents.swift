import UIKit

// MARK: - Bai6
class HinhVe {
    
    var ten: String
    
    init(ten: String) {
        self.ten = ten
    }
    
    func dienTich() -> String {
        return "Dien Tich"
    }
    
    func chuVi() -> String {
        return "Chu Vi"
    }
    
    func theTich() -> String {
        return "The Tich"
    }
}

class HaiChieu: HinhVe { }

class HinhTron: HaiChieu {
    
    override func dienTich() -> String {
        return "Dien Tich Hinh Vuong"
    }
    
    override func chuVi() -> String {
        return "Chu Vi Hinh Vuong"
    }
    
}

class HinhTamGiac: HaiChieu {
    
    override func dienTich() -> String {
        return "Dien Tich Hinh Tam Giac"
    }
    
    override func chuVi() -> String {
        return "Chu Vi Hinh Tam Giac"
    }
}

class BaChieu: HinhVe { }

class HinhCau: BaChieu {
    
    override func dienTich() -> String {
        return "Dien Tich Hinh Cau"
    }
    
    override func theTich() -> String {
        return "The Tich Hinh Cau"
    }
}

class LapPhuong: BaChieu {
    
    override func dienTich() -> String {
        return "Dien Tich Hinh Cau"
    }
    
    override func chuVi() -> String {
        return "Chu Vi Lap Phuong"
    }
}

// MARK: - Bai7
final class HocSinh {
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

class DSHocSinh {
    
    var ds: [HocSinh]
    
    init(ds: [HocSinh]) {
        self.ds = ds
    }
    
    func sapXep() -> [HocSinh] {
        // sap xep theo tong diem
        ds.sort { (hs1: HocSinh, hs2: HocSinh) -> Bool in
            return hs1.tongDiem >= hs2.tongDiem
        }
        
        for hocSinh in ds {
            hocSinh.hoTen = hocSinh.hoTen.capitalized
        }
        
        return ds
    }
    
    func inKetQua(ds: [HocSinh]) -> String {
        var kq = ""
        for hs in ds {
            kq += hs.hoTen + "  \(hs.tongDiem)" + "\n"
        }
        return kq
    }
}

var hs1 = HocSinh(hoTen: "nguyen van a", namSinh: 1999, tongDiem: 8.0)
var hs2 = HocSinh(hoTen: "nguyen van mmka", namSinh: 1999, tongDiem: 9.0)
var hs3 = HocSinh(hoTen: "nguyen van opop", namSinh: 1999, tongDiem: 7.0)
var hs4 = HocSinh(hoTen: "nguyen van b", namSinh: 1999, tongDiem: 10.0)
var hs5 = HocSinh(hoTen: "nguyen van alll", namSinh: 1997, tongDiem: 10.0)
var ds = DSHocSinh(ds: [hs1, hs2, hs3, hs4, hs5])
print(ds.sapXep())

// MARK: - Bai8
final class Date {
    var day: Int
    var month: Int
    var year: Int
    
    init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
        
    func dayIns() -> Int {
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
        guard day < dayIns() else {
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
    
    func advance(d: Int, m: Int, y: Int) {
        day += d
        month += m
        year += y
        
        while (month > 12) {
            year += 1
            month -= 12
        }
    }
}

var date = Date(day: 28, month: 2, year: 0)
date.printDate()
date.normalize()

// MARK: - Bai 9
class Mang1C {
    
    var mangMotChieu: [Int]
    
    init(mangMotChieu: [Int]) {
        self.mangMotChieu = mangMotChieu
    }
    
    func inMang() {
        for i in 0..<mangMotChieu.count {
            print(mangMotChieu[i])
        }
    }
    
    func phanTuLonNhat() -> Int {
        var max = mangMotChieu[0]
        
        for i in 0..<mangMotChieu.count where mangMotChieu[i] > max {
            max = mangMotChieu[i]
        }
        
        return max
    }
    
    func phanTuNhoNhat() -> Int {
        var min = mangMotChieu[0]
        for i in 0..<mangMotChieu.count where mangMotChieu[i] < min {
            min = mangMotChieu[i]
        }
        return min
    }
}


// MARK: - Bai10
class A {
    var i: Int
    
    init(i: Int) {
        self.i = i
    }
    
    func tinhTongNSoNguyenDuongDauTien() -> Int {
        var tong = 0
        for index in 1..<i {
            tong += index
        }
        return tong
    }
}

var a = A(i: 10)
print(a.tinhTongNSoNguyenDuongDauTien())
