import UIKit

var greeting = "Hello, playground"

class phanSo{
    var tuSo: Int
    var mauSo: Int
    
    init(tuSo: Int, mauSo: Int){
        self.tuSo = tuSo
        self.mauSo = mauSo
    }
    
    func congPhanSo(ps: phanSo) -> (a: Int, b: Int) {
        let tuSo1 = self.tuSo * ps.mauSo + self.mauSo * ps.tuSo
        let mauSo1 = self.mauSo * ps.mauSo
        
        return (tuSo1,mauSo1)
    }
    func truPhanSo(ps: phanSo) -> (a: Int, b: Int) {
        let tuSo1 = self.tuSo * ps.mauSo - self.mauSo * ps.tuSo
        let mauSo1 = self.mauSo * ps.mauSo
        
        return (tuSo1,mauSo1)
    }
    func nhanPhanSo(ps: phanSo) -> (a: Int, b: Int) {
        let tuSo1 = self.tuSo * ps.tuSo
        let mauSo1 = self.mauSo * ps.mauSo
        
        return (tuSo1,mauSo1)
    }
    func chiaPhanSo(ps: phanSo) -> (a: Int, b: Int) {
        let tuSo1 = self.tuSo * ps.mauSo
        let mauSo1 = self.mauSo * ps.tuSo
        
        return (tuSo1,mauSo1)
    }
}

let ps1 = phanSo(tuSo: 5, mauSo: 3)
let ps2 = phanSo(tuSo: 3, mauSo: 9)
print("Cộng phân số: \(ps1.congPhanSo(ps: ps2).a)/\(ps1.congPhanSo(ps: ps2).b)")
print("Trừ phân số: \(ps1.truPhanSo(ps: ps2).a)/\(ps1.truPhanSo(ps: ps2).b)")
print("Nhân phân số: \(ps1.nhanPhanSo(ps: ps2).a)/\(ps1.nhanPhanSo(ps: ps2).b)")
print("Chia phân số: \(ps1.chiaPhanSo(ps: ps2).a)/\(ps1.chiaPhanSo(ps: ps2).b)")

// bài tập 2

class daGiac{
    var soCanh: Int
    var intArr: [Int]
    
    init(soCanh: Int, intArr: [Int]) {
        self.soCanh = soCanh
        self.intArr = intArr
    }
    
    func chuVi() -> Int {
        var cv: Int = 0
        for i in intArr{
            cv += i
        }
        
        return cv
    }
    func inGiaTri(){
        for i in intArr{
            print(i)
        }
    }
}

let daGiac1 = daGiac(soCanh: 4, intArr: [1,2,3,6])
print("Chu vi của Đa giác là: \(daGiac1.chuVi())")
daGiac1.inGiaTri()

// bài tập 3 và bài tập 4

class tamGiac: daGiac {
    
    override func chuVi() -> Int {
        var cv: Int = 0
        for i in 1..<soCanh {
            cv += intArr[i]
        }
        
        return cv
    }
    
    func dienTich() -> Float {
        var dt: Float = 0.0
        var p: Float = (Float(intArr[0]) + Float(intArr[1]) + Float(intArr[2])) / 2
        dt = (p * (p - Float(intArr[0])) * (p - Float(intArr[1])) * (p - Float(intArr[2]))).squareRoot()
        //6 * 1 *
        return dt
    }
    
    func checkTamGiac(a: Int, b: Int, c: Int) -> Bool {
        
        if a + b > c || a + c > b || b + c > a {
            return true
        }else{
            return false
        }
        
        return false
    }
    func checkTamGiacVuong() -> Bool{
        let a: Int = intArr[0]
        let b: Int = intArr[1]
        let c: Int = intArr[2]
        var canhHuyen: Int = 0
        if checkTamGiac(a: a, b: b, c: c) {
            if a > b {
                if a > c {
                    canhHuyen = a
                    if (canhHuyen * canhHuyen) == (b * b + c * c) {
                        return true
                    }
                }else{
                    canhHuyen = c
                    if (canhHuyen * canhHuyen) == (a * a + b * b) {
                        return true
                    }
                }
            }else{
                if b > c {
                    canhHuyen = b
                    if (canhHuyen * canhHuyen) == (a * a + c * c) {
                        return true
                    }
                }else{
                    canhHuyen = c
                    if (canhHuyen * canhHuyen) == (a * a + b * b) {
                        return true
                    }
                }
            }
        } else {
            return false
        }
        
        return false
        
    }
}

let tamGiac1 = tamGiac(soCanh: 3, intArr: [3,4,6])
print("Chu vi tam giac: \(tamGiac1.chuVi())")
print("Dien tich tam giac: \(tamGiac1.dienTich())")
if tamGiac1.checkTamGiacVuong() {
    print("Tam giác trên là tam giác vuông")
}else{
    print("Tam giác trên không phải tam giác vuông")
}

// Bài tập 5

class CStack {
    var capacity: Int
    var top: Int = 0
    var arr: [Int] = []
    
    init(capacity: Int, top: Int, arr: [Int]) {
        self.capacity = capacity
        self.top = top
        self.arr = arr
    }
    
    func isEmty() -> Bool {
        return top == 0
    }
    
    func isFull() -> Bool {
        return top >= capacity - 1
    }
    
    func push(value: Int) {
        if isFull() {
            print("ngăn xếp đã đầy ")
            return
        } else {
            top += 1
            arr.append(value)
        }
    }
    
    func pop() {
        if isEmty() {
            print("ngan xep rỗng")
            return
        } else {
            top -= 1
            arr.remove(at: top)
        }
    }
}

let testStack = CStack(capacity: 3, top: -1, arr: [3])
testStack.push(value: 2)
testStack.push(value: 3)
testStack.push(value: 3)
testStack.push(value: 3)
testStack.pop()
testStack.push(value: 3)
testStack.push(value: 3)


// Bài tập 6

class hinhVe {
    var soChieu: Int?
    
    init(soChieu: Int) {
        self.soChieu = soChieu
        
    }
}

class haiChieu: hinhVe {
    
    var type: String?
    
    init(soChieu: Int, type: String) {
        super.init(soChieu: soChieu)
        self.type = type
    }
    
    func chuVi() -> Double{
        return 0
    }
    
    func dienTich() -> Double {
        return 0
    }
}

class baChieu: hinhVe {
    var type: String?
    init(soChieu: Int, type: String) {
        super.init(soChieu: soChieu)
        self.type = type
    }
    
    func chuVi() -> Double {
        return 0
    }
    
    func dienTich() -> Double {
        return 0
    }
    
    func theTich() -> Double {
        return 0
    }
}
class hinhTron: haiChieu {
    var banKinh: Int?
    init(soChieu: Int, type: String, banKinh: Int) {
        super.init(soChieu: soChieu, type: type)
        self.banKinh = banKinh
    }
    
    override func chuVi() -> Double {
        return (Double.pi * 2 * Double(banKinh!))
    }
    
    override func dienTich() -> Double {
        return (Double.pi * Double(banKinh!) * Double(banKinh!))
    }
}
class hinhVuong: haiChieu {
    
    var value: Int?
    var cv: Int = 0
    
    init(soChieu: Int, type: String, value: Int) {
        super.init(soChieu: soChieu, type: type)
        self.value = value
    }
    
    override func chuVi() -> Double {
        return Double(value!) * 4
    }
    
    override func dienTich() -> Double {
        return Double(value!) * Double(value!)
    }
    
}

class HinhLapPhuong: baChieu{
    
    var value: Int?
    
    init(soChieu: Int, type: String, value: Int) {
        super.init(soChieu: soChieu, type: type)
        self.value = value
    }
    
    override func chuVi() -> Double {
        return 12 * Double(value!)
    }
    
    override func dienTich() -> Double {
        return 6 * Double(value!) * Double(value!)
    }
    
    override func theTich() -> Double {
        return Double(value!) * Double(value!) * Double(value!)
    }
}

let hinhTron1 = hinhTron(soChieu: 2, type: "Tròn", banKinh: 2)
let hinhVuong1 = hinhVuong(soChieu: 2, type: "Vuông", value: 4)
let hinhLapPhuong = HinhLapPhuong(soChieu: 3, type: "Hình Lập Phương", value: 5)
print("Chu vi hình tròn là: \(hinhTron1.chuVi())")
print("Diện tích hình tròn là: \(hinhTron1.dienTich())")
print("Chu vi hình Vuông là: \(hinhVuong1.chuVi())")
print("Diện tích hình Vuông là: \(hinhVuong1.dienTich())")
print("Chu vi hình lập phương là: \(hinhLapPhuong.chuVi())")
print("Diện tích hình lập phương là: \(hinhLapPhuong.dienTich())")
print("Thể tích hình lập phương là: \(hinhLapPhuong.theTich())")


// bài tập 7

struct hocSinh{
    var hoTen: String?
    var namSinh: Int?
    var tongDiem: Float?
    
}

struct arr{
    var arrHocSinh: [hocSinh] = []
    
    init(arrHocSinh: [hocSinh]){
        self.arrHocSinh = arrHocSinh
    }
    
    mutating func sapXep(){
        var temp = arrHocSinh[0]
        for i in 0..<arrHocSinh.count - 1 {
            for j in (i+1)..<arrHocSinh.count {
                if arrHocSinh[i].tongDiem! < arrHocSinh[j].tongDiem! {
                    temp = arrHocSinh[j]
                    arrHocSinh[j] = arrHocSinh[i]
                    arrHocSinh[i] = temp
                } else if arrHocSinh[i].tongDiem! == arrHocSinh[j].tongDiem! {
                    if arrHocSinh[i].namSinh! > arrHocSinh[j].namSinh!{
                        temp = arrHocSinh[j]
                        arrHocSinh[j] = arrHocSinh[i]
                        arrHocSinh[i] = temp
                    }
                }
            }
        }
    }
    
    func inHocSinh(){
        for c in arrHocSinh{
            print("Họ tên: \(c.hoTen!), Năm sinh: \(c.namSinh!), Tổng điểm: \(c.tongDiem!)")
        }
    }
}


let hocSinh1 = hocSinh(hoTen: "Lê Công Tú", namSinh: 2001, tongDiem: 7.3)
let hocSinh2 = hocSinh(hoTen: "Đoàn Trần Hiếu My", namSinh: 2002, tongDiem: 7.9)
let hocSinh3 = hocSinh(hoTen: "Đặng Thị Như Quỳnh", namSinh: 2005, tongDiem: 8)
let hocSinh4 = hocSinh(hoTen: "Đặng Ngọc Thanh Thuận", namSinh: 2000, tongDiem: 7.9)
var arr1 = arr(arrHocSinh: [hocSinh1, hocSinh2, hocSinh3, hocSinh4])
arr1.sapXep()
arr1.inHocSinh()


//Bài tập 8
struct Date {
    
    var ngay: Int
    var thang: Int
    var nam: Int
    
    func daysIn() -> Int {
        var dayIn = 31
        switch thang {
        case 2:
            if (nam % 400 == 0) || (nam % 4 == 0 && nam % 100 != 0) {
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
        if nam < 1 || nam > 9999 || thang < 1 || thang > 12 || ngay < 1 || ngay > 31 {
            return false
        } else if ngay > daysIn() {
            return false
        }
        return true
    }
    
    func printDate() {
        print("\(ngay)/\(thang)/\(nam)")
    }
    
    mutating func advance() {
        ngay += 1
        if ngay > daysIn() {
            ngay = 1
            thang += 1
            if thang > 12 {
                thang = 1
                nam += 1
            }
        }
        print("ngày tiếp theo")
        printDate()
    }
}

var date = Date(ngay: 25, thang: 2, nam: 2019)
if date.check(){
    date.printDate()
    date.advance()
}

//bài tập 9

struct mang1C{
    var intArr: [Int]
    
    func printArr(){
        for i in intArr{
            print("\(i)")
        }
    }
    func minMax() -> (min: Int, max: Int){
        var currentMin: Int = intArr[0]
        var currentMax: Int = intArr[0]
        for value in intArr{
            if value < currentMin{
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
}

let inMang = mang1C(intArr: [1,2,7,3,9,5])
inMang.printArr()
print("Phần tử lớn nhất là: \(inMang.minMax().max), phần tử nhỏ nhất là: \(inMang.minMax().min)")

// bài tập 10

struct tinhTong{
    var n: Int
    
    func sumN() -> Int{
        var sum: Int = 0
        for i in 1...n{
            sum += i
        }
        return sum
    }
}

let tinhTong1 = tinhTong(n: 100)
print("Tổng \(tinhTong1.n) phần tử là: \(tinhTong1.sumN())")

