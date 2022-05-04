import UIKit

//MARK: -BAI TAP 2
class DaGiac {
    var soCanhDaGiac: Int
    var mangDoLonCanhDaGiac: [Int]
    init(n: Int, mangDoLon: [Int]) {
        self.soCanhDaGiac = n
        self.mangDoLonCanhDaGiac = Array(mangDoLon[0..<n])
    }
    
    func tinhChuVi() -> Int {
        var chuVi: Int = 0
        for doLonCanh in mangDoLonCanhDaGiac {
            chuVi = chuVi + doLonCanh
        }
        return chuVi
    }
    
    func inGiaTriCacCanh(){
        for (index,doLonCanh) in mangDoLonCanhDaGiac.enumerated() {
            print("do lon cua canh thu \(index) = \(doLonCanh)")
        }
    }
}

DaGiac.init(n: 3, mangDoLon: [1, 2, 3]).inGiaTriCacCanh()

//MARK: -BAI TAP 3 & 4
class TamGiac: DaGiac {
    
    func tinhDienTichTamGiac() {
        var chuVi: Float = Float(tinhChuVi())
        chuVi = sqrt(chuVi * (chuVi - Float(mangDoLonCanhDaGiac[0])) * (chuVi - Float(mangDoLonCanhDaGiac[1])) * (chuVi - Float(mangDoLonCanhDaGiac[2])))
    }
    
    func inCacCanhTamGiacPitago(dsTamGiac: [TamGiac]) {
        for tamGiac in dsTamGiac {
            let canhA = tamGiac.mangDoLonCanhDaGiac[0]
            let canhB = tamGiac.mangDoLonCanhDaGiac[1]
            let canhC = tamGiac.mangDoLonCanhDaGiac[2]
            if canhA * canhA == canhB * canhB + canhC * canhC ||
                canhB * canhB == canhA * canhA + canhC * canhC ||
                canhC * canhC == canhA * canhA + canhB * canhB {
                print("canh A = ", canhA)
                print("canh B = ", canhB)
                print("canh C = ", canhC)
            }
        }
    }
}
TamGiac(n: 3, mangDoLon: [1, 2, 3]).inCacCanhTamGiacPitago(dsTamGiac: [TamGiac(n: 3, mangDoLon: [1, 2, 3]), TamGiac(n: 3, mangDoLon: [3, 4, 5]), TamGiac(n: 3, mangDoLon: [1, 2, 1])])

//MARK: -BAI TAP 5
class CStack {
    var size: Int
    var top: Int
    var stack: [Int]
    init(size: Int, top: Int, stack: [Int]) {
        self.size = size
        self.top = top
        self.stack = stack
    }
    
    func isEmpty() -> Bool {
        return top == 0
    }
    
    func isFull() -> Bool {
        return top == size
    }
    
    func push(item: Int) {
        if isFull() {
            print("stack is full")
        } else {
            top += 1
            stack[top] = item
        }
    }
    
    func pop() {
        if isEmpty() {
            print("stack is empty")
        } else {
            stack[top] = 0
        }
    }
}

//MARK: -BAI TAP 6
class HinhVe {
    init() {
        
    }
    func tinhChuVi() -> Float {
        return 1.0
    }
    func tinhDienTich() -> Float {
        return 1.0
    }
}
class HaiChieu: HinhVe {
    override init() {
        super.init()
    }
}
class HinhTron: HaiChieu {
    var banKinh: Float
    let pi: Float = 3.14
    init(banKinh: Float) {
        self.banKinh = banKinh
    }
    
    override func tinhChuVi() -> Float {
        return 2 * banKinh * pi
    }
    override func tinhDienTich() -> Float {
        return pi * banKinh * banKinh
    }
}
class HinhVuong: HaiChieu {
    var canh: Float
    init(canh: Float) {
        self.canh = canh
    }
    override func tinhChuVi() -> Float {
        return 4 * canh
    }
    override func tinhDienTich() -> Float {
        return canh * canh
    }
}
class TamGiac1: HaiChieu {
    var canhA: Float
    var canhB: Float
    var canhC: Float
    init(canhA: Float, canhB: Float, canhC: Float) {
        self.canhA = canhA
        self.canhB = canhB
        self.canhC = canhC
    }
    override func tinhChuVi() -> Float {
        return canhA + canhB + canhC
    }
    override func tinhDienTich() -> Float {
        let chuVi = tinhChuVi()
        return sqrtf(chuVi * (chuVi - canhA) * (chuVi - canhB) * (chuVi - canhC))
    }
}
class BaChieu: HinhVe {
    func tinhTheTich() -> Float {
        return 1.0
    }
}
class HinhCau: BaChieu {
    var banKinh: Float
    let pi: Float = 3.14
    init(banKinh: Float) {
        self.banKinh = banKinh
    }
    override func tinhChuVi() -> Float {
        return 2 * pi * banKinh
    }
    override func tinhDienTich() -> Float {
        return 4 * pi * banKinh * banKinh
    }
    override func tinhTheTich() -> Float {
        return 4 / 3 * pi * banKinh * banKinh * banKinh
    }
}
class HinhLapPhuong: BaChieu {
    var canh: Float
    init(canh: Float) {
        self.canh = canh
    }
    override func tinhChuVi() -> Float {
        return 12 * canh
    }
    override func tinhTheTich() -> Float {
        return 4 * canh * canh
    }
    override func tinhDienTich() -> Float {
        return canh * canh * canh
    }
    
}

//MARK: -BAI TAP 7
class HocSinh {
    var ho: String
    var ten: String
    var namSinh: Int
    var tongDiem: Int
    init(ho: String, ten: String, namSinh: Int, tongDiem: Int) {
        self.ho = ho
        self.ten = ten
        self.namSinh = namSinh
        self.tongDiem = tongDiem
    }
    func xepLoaiHocSinh(dsHocSinh: [HocSinh]) {
        var dsHocSinhTemp: [HocSinh] = [HocSinh]()
        dsHocSinhTemp = dsHocSinh.sorted(by: {
            if $0.tongDiem == $1.tongDiem {
                return $0.namSinh < $1.namSinh
            } else {
                return $0.tongDiem > $1.tongDiem
            }
        })
        for ds in dsHocSinhTemp{
            print(ds.namSinh)
        }
        
    }
    func testBT7() {
        xepLoaiHocSinh(dsHocSinh: [HocSinh(ho: "Tuan", ten: "Tran", namSinh: 2015, tongDiem: 1), HocSinh(ho: "van", ten: "tran",namSinh: 2014, tongDiem: 2), HocSinh(ho: "Tran", ten: "Di", namSinh: 2013, tongDiem: 2), HocSinh(ho: "THien", ten: "Di", namSinh: 2012, tongDiem: 4)])
        print()
    }
    
}
HocSinh(ho: "a", ten: "b", namSinh: 2011, tongDiem: 2).testBT7()

//MARK: -BAI TAP 8
final class Date {
    var date: Int
    var month: Int
    var year: Int
    init(date: Int, month: Int, year: Int) {
        self.date = date
        self.month = month
        self.year = year
    }
    
    func daysIn(month: Int) -> Int {
        switch month {
        case 1, 3, 5, 7, 8, 10, 12:
            return 31
        case 4, 6, 9, 11:
            return 30
        case 2:
            return 28
        default:
            print("Month is not correct, please type again")
            return 0
        }
    }
    
    func normalize() -> Date {
        if date > 0, date <= daysIn(month: month), month > 0, month <= 12, year > 0, year == 1 {
            return Date(date: date, month: month, year: year)
        } else {
            print("Date is not correct, please retype your date")
            return Date(date: 0, month: 0, year: 0)
        }
    }
    
    func advance(date: Date) -> Date {
        let date = date.normalize()
        if date.date != 0 {
            self.date = self.date + date.date
            self.month = self.month + date.month
            self.year = self.year + date.year
            let tempDate = Date(date: self.date, month: self.month, year: self.year).normalize()
            return tempDate
        }
        return Date(date: 0, month: 0, year: 0)
    }
}

//MARK: -BAI TAP 9
final class Mang1c<Element: Comparable> {
    var arr: [Element] = []
    func printArr() {
        arr.forEach { print($0) }
    }
    
    func findMinMax() -> (min: Element?, max: Element?) {
        return (min: arr.min(), max: arr.max())
    }
}
var a = Mang1c<Int>()
a.arr = [1, 2, 3]
a.findMinMax()



//MARK: -BAI TAP 10
final class A {
    var number: Int = 100
    init(number: Int) {
        self.number = number
    }
    func sum(n: Int) -> Int {
        return n * (n + 1) / 2
    }
}
