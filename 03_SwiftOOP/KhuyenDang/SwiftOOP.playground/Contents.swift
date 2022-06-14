import UIKit

// Bài tập 1
class PhanSo {

    var tuSo: Int
    var mauSo: Int

    init(tuSo: Int, mauSo: Int) {
        self.tuSo = tuSo
        self.mauSo = mauSo
    }

    func congPS(phanSo: PhanSo) -> PhanSo {
        let tu = tuSo * phanSo.mauSo + phanSo.tuSo * mauSo
        let mau = mauSo * phanSo.mauSo
        return PhanSo(tuSo: tu, mauSo: mau)
    }

    func truPS(phanSo: PhanSo) -> PhanSo {
        let tu = tuSo * phanSo.mauSo - phanSo.tuSo * mauSo
        let mau = mauSo * phanSo.mauSo
        return PhanSo(tuSo: tu, mauSo: mau)
    }

    func nhanPS(phanSo: PhanSo) -> PhanSo {
        let tu = tuSo * phanSo.tuSo
        let mau = mauSo * phanSo.mauSo
        return PhanSo(tuSo: tu, mauSo: mau)
    }

    func chiaPS(phanSo: PhanSo) -> PhanSo {
        let tu = tuSo * phanSo.mauSo
        let mau = mauSo * phanSo.tuSo
        return PhanSo(tuSo: tu, mauSo: mau)
    }
}
var phanso1: PhanSo = PhanSo( tuSo: 3, mauSo:4)
var phanso2: PhanSo = PhanSo( tuSo: 2, mauSo:5)
print("Tổng 2 phân số là: \(phanso1.congPS(phanSo:phanso2).tuSo)/\(phanso1.congPS(phanSo:phanso2).mauSo)")
print("Hiệu 2 phân số là: \(phanso1.truPS(phanSo:phanso2).tuSo)/\(phanso1.truPS(phanSo:phanso2).mauSo)")
print("Nhân 2 phân số là: \(phanso1.nhanPS(phanSo:phanso2).tuSo)/\(phanso1.nhanPS(phanSo:phanso2).mauSo)")
print("Tổng 2 phân số là: \(phanso1.chiaPS(phanSo:phanso2).tuSo)/\(phanso1.chiaPS(phanSo:phanso2).mauSo)")

 //Bài tập 2

class DaGiac {

    var soCanh: Int
    var a: [Int]

    init(soCanh: Int, a: [Int]) {
            self.soCanh = soCanh
            self.a = a
    }

    func tinhCV() -> Int {
        var chuvi: Int = 0
        for i in 0..<soCanh {
            chuvi += a[i]
        }
        return chuvi
    }
    func inCanh() {
        print("Giá trị các cạnh là: ")
        for i in 0..<soCanh {
            print(a[i])
        }
    }
}
var dagiac: DaGiac = DaGiac(soCanh: 3, a: [1,2,3,])
dagiac.tinhCV()
dagiac.inCanh()

 //Bài tập 3
class TamGiac: DaGiac {

    override init(soCanh: Int = 3, a: [Int]) {
        super.init(soCanh: soCanh, a: a)
    }

    override func tinhCV() -> Int {
        super.tinhCV()
    }

    func tinhDienTich() -> Float {
        let A: Int = a[0]
        let B: Int = a[1]
        let C: Int = a[2]
        let P: Float = (Float(A) + Float(B) + Float(C)) / 2
        return Float(sqrt(P * (P - Float(A)) * (P - Float(B)) * (P - Float(C))))
    }
    //Bài tập 4
    func isPitago() -> String {
        let A: Int = a[0]
        let B: Int = a[1]
        let C: Int = a[2]

        if A * A == B * B + C * C || B * B == A * A + C * C || C * C == B * B + A * A {
            return "Tam giác thoả mãn định lý Pitago"
        } else {
            return "Tam giác không thoả mãn định lý Pitago"
        }
    }
}
var tamgiac: TamGiac = TamGiac(a: [3,4,6])
tamgiac.tinhCV()
tamgiac.tinhDienTich()
print("\(tamgiac.isPitago())")

//Bài tập 5
class CStack {

    var stack: [Int]
    var size: Int = 3 // số phẩn tử tối đa trong ngăn xếp
    var index: Int // số phần tử có trong ngăn xếp

    init(stack: [Int]) {
        self.stack = stack
        self.index = stack.count
    }

    func push(element: Int) {
        if checkFull() {
            print("Ngăn xếp đầy")
            return
        } else {
            stack.append(element)
         }
    }

    func pop() {
        if checkEmpty() {
            print("Ngăn xếp rỗng")
            return
        } else {
            stack.popLast()
         }
    }

    func checkEmpty() -> Bool {
        return index == 0 ? true : false
    }

    func checkFull() -> Bool {
        return index == size ? true : false
    }
}
let arr = CStack(stack: [1, 2, 3])
arr.checkEmpty()
arr.checkFull()
arr.push(element: 4)
arr.pop()

//Bài tập 6
class HinhVe {

    func dienTich() -> Float { return 0.0 }
    func chuVi() -> Float { return 0.0 }
    func theTich() -> Float { return 0.0 }
    func inGiaTri() -> String { return ""}
}

class HaiChieu: HinhVe {
    override func dienTich() -> Float { return 0.0 }
    override func chuVi() -> Float { return 0.0 }
    override func inGiaTri() -> String {
        return "Diện tích = \(dienTich()) và chu vi = \(chuVi())"
    }
}

class BaChieu: HinhVe {
    override func dienTich() -> Float { return 0.0 }
    override func theTich() -> Float { return 0.0 }
    override func inGiaTri() -> String {
        return "Diện tích = \(dienTich()) và thể tích = \(theTich())"
    }
}

class HinhVuong: HaiChieu {

    var canh: Float

    init(canh: Float) {
        self.canh = canh
    }
    override func chuVi() -> Float {
        return canh * 4
    }

    override func dienTich() -> Float {
        return canh * canh
    }
}

class HinhTron: HaiChieu {

    var banKinh: Float

    init(banKinh: Float) {
        self.banKinh = banKinh
    }
    override func chuVi() -> Float {
        return 2 * Float.pi * banKinh
    }

    override func dienTich() -> Float {
        return Float.pi * banKinh * banKinh
    }
}

class HinhTamGiac: HaiChieu {

    var canh1: Float
    var canh2: Float
    var canh3: Float

    init(canh1: Float, canh2: Float, canh3: Float) {
        self.canh1 = canh1
        self.canh2 = canh2
        self.canh3 = canh3
    }

    override func chuVi() -> Float {
        return canh1 + canh2 + canh3
    }

    override func dienTich() -> Float {
        let P: Float = (canh1 + canh2 + canh3) / 2
        return Float(sqrt(P * (P - canh1) * (P - canh2) * (P - canh3)))
    }
}

class HinhCau: BaChieu {

    var banKinh: Float

    init(banKinh: Float) {
        self.banKinh = banKinh
    }

    override func dienTich() -> Float {
        return 4 * Float.pi * banKinh * banKinh
    }

    override func theTich() -> Float {
        return 4/3 * Float.pi * banKinh * banKinh *  banKinh
    }
}

class HinhLapPhuong: BaChieu {

    var canh: Float

    init(canh: Float) {
        self.canh = canh
    }

    override func dienTich() -> Float {
        return 6 * canh * canh
    }

    override func theTich() -> Float {
        return canh * canh * canh
    }
}

 //Bài tập 7

class Student {
    var name: String
    var yearOfBirth: Int
    var score: Float
    init(name: String, yearOfBirth: Int, score: Float) {
        self.name = name
        self.yearOfBirth = yearOfBirth
        self.score = score
    }
}

class ClassRoom {

    var listStudent: [Student] = []

    init(listStudent: [Student] = []) {
        self.listStudent = listStudent
    }

    func sort() -> [Student] {
        var list: [Student] = []
        list = listStudent.sorted { (s1: Student, s2: Student) -> Bool in
            if s1.score > s2.score {
                return true
            } else if s1.score == s2.score {
                    if s1.yearOfBirth > s2.yearOfBirth {
                        return true
                    } else { return false}
                } else { return false}
        }
        for i in list {
            i.name = i.name.capitalized
        }
        return list
    }
    
    func printListStudent() -> String {
        var result: String = ""
        for i in sort() {
            result += "Họ tên: \(i.name), năm sinh: \(i.yearOfBirth), tổng điểm: \(i.score) \n"
        }
        return result
    }
}
var s1 = Student(name: "đặng thị tú khuyên", yearOfBirth: 2000, score: 3.3)
var s2 = Student(name: "nguyễn văn A", yearOfBirth: 2001, score: 3.3)
var s3 = Student(name: "trần thị b", yearOfBirth: 2001, score: 3.1)
var aaa = ClassRoom(listStudent: [s1,s2,s3])

//Bài tập 8

class Date {

    var day: Int
    var month: Int
    var year: Int

    init(day:Int, month:Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    func printDate() -> String {
        return "Ngày \(day) tháng \(month) năm \(year)"
    }
    func isLeapYear() -> Bool {
        return ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)
    }
    func daysIn() -> Int {
        switch month {
        case 4, 6, 9, 11:
            return 30
        case 2:
            return isLeapYear() ? 29 : 28
        default:
            return 31
        }
    }
    
    func normalize() -> Bool {
        return (year < 1 || year > 9999 || month < 1 || month > 12 || day > daysIn()) ? false : true
    }
    
    func advance() -> Date {
        
        while !normalize() {
            if day > daysIn() {
                day -= daysIn()
                month += 1
            }
            if month > 12 {
                month -= 12
                year += 1
            }
        }
        return Date(day: day, month: month, year: year)
    }
}
let a: Date = Date(day: 67, month: 26, year: 2016)

// Bài tập 9
 
class Mang1c {

    var arr: [Int]

    init(arr: [Int]) {
        self.arr = arr
    }

    func inMang() {
        for i in arr { print(i) }
    }

    func timMin() -> Int {
        var min: Int = arr[0]
        for i in arr {
            if i < min { min = i }
        }
        return min
    }

    func timMax() -> Int {
        var max: Int = arr[0]
        for i in arr {
            if i > max { max = i}
        }
        return max
    }
}

 //Bài tập 10

class A {
    var n: Int

    init(n: Int) {
        self.n = n
    }

    func tinhTong() -> Int {
        var sum: Int = 0
        for i in 1...n {
            sum += i
        }
        return sum
    }
}


