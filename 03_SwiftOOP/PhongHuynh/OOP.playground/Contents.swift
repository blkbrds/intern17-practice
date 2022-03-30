import UIKit

//Bai 01----------------------------------------------------------------------------------------------------------------
struct PhanSo {
    var tuSo: Float
    var mauSo: Float

init(tuso: Float, mauso: Float) {
    self.tuSo = tuso
    self.mauSo = mauso
}
}

func congPS(f1: PhanSo, f2:PhanSo) -> Float {
    let Tu = f1.tuSo * f2.mauSo + f2.tuSo * f1.mauSo
    let Mau = f1.mauSo * f2.mauSo
    return Tu/Mau
}

func truPS(f1: PhanSo, f2:PhanSo) -> Float {
    let Tu = f1.tuSo * f2.mauSo - f2.tuSo * f1.mauSo
    let Mau = f1.mauSo * f2.mauSo
return Tu/Mau
}

func nhanPS(f1: PhanSo, f2:PhanSo) -> Float {
    let Tu = f1.tuSo * f2.tuSo
    let Mau = f1.mauSo * f2.mauSo
return Tu/Mau
}

func chiaPS(f1: PhanSo, f2:PhanSo) -> Float {
    let Tu = f1.tuSo * f2.mauSo
    let Mau = f1.mauSo * f2.tuSo
return Tu/Mau
}
let ps1 = PhanSo(tuso: 3, mauso: 4)
let ps2 = PhanSo(tuso: 5, mauso: 4)
print("kết quả cộng, trừ, nhân, chia hai phân số lần lượt là: \(congPS(f1: ps1, f2: ps2)), \(truPS(f1: ps1, f2: ps2)), \(nhanPS(f1: ps1, f2: ps2)), \(chiaPS(f1: ps1, f2: ps2))")

//Bai 02, Bài 03, Bài 04 ----------------------------------------------------------------------------------------------------------------
class DaGiac {
    var soCanh:Int
    var a:[Int]
    
    init(soCanh: Int, a: [Int]) {
        self.soCanh = soCanh
        self.a = a
   }

    func tinhChuVi() -> Int {
        var cv: Int = 0
        for i in a {
            cv = cv + i
        }
        return cv
    }
    func inRaCanhDaGiac() {
        print("cac canh cua da giac la: ")
    }
}
 
class TamGiac : DaGiac {
    
    override init(soCanh: Int, a: [Int]) {
        super.init(soCanh: soCanh, a: a)
    }
    
    override func tinhChuVi() -> Int {
        var cv: Int = 0
        for i in a {
            cv = cv + i
        }
        return cv
    }
    
    func tinhDienTich() -> Float {
        let p: Float = Float(tinhChuVi() / 2)
        let a: Float = p * ( p - Float(super.a[0]))*( p - Float(super.a[1]) )*( p - Float(super.a[2]))
        return (sqrt(Float(a)))
    }
    
    func pyTaGo() -> String {
        return pow(Decimal(a[0]), 2) + pow(Decimal(a[1]), 2) == pow(Decimal(a[2]), 2) ? "thoả mãn điều kiện, các cạnh của tam giác là : \(a[0]), \(a[1]), \(a[2])" : "không thoả"
    }
    
}

let tamGiac1 = TamGiac(soCanh: 3, a: [3,4,5])
let tamGiac2 = TamGiac(soCanh: 3, a: [1,2,5])
print("chu vi của tam giác là: \(tamGiac1.tinhChuVi())")
print("diện tích của tam giác là: \(tamGiac1.tinhDienTich())")
print(tamGiac1.pyTaGo())

//Bai 05 -------------------------------------------------------------------------------------------------
struct CStack{
    var top: Int
    var capacity: Int
    var array: [Int]

    init(top: Int, capacity: Int ,array: [Int]) {
        self.top = top
        self.array = array
        self.capacity = capacity
    }

    func isFull(stack: Int) -> Bool{         //kiểm tra stack đầy
        return top >= capacity - 1
    }
    func isEmpty() -> Bool {                     //kiểm tra stack rỗng
        return top == -1
    }
    mutating func pUSH( value: Int, capacity: Int){             //thêm một phần tử vào stack
    if(isFull(stack: capacity) == true){
        print("\nStack is full. Overflow condition!");
    }else{
        top+=1
        array[top] = value
        //stack[top] = value;
    }
    }
    mutating func pOP(){                                                     //xoá 1 phần tử ở đỉnh stack
    if(isEmpty() == true){
        print("\nStack is empty. Underflow condition!");
    }else{
        top-=1
    }
    }
}
var stack = CStack(top: -1, capacity: 3, array: [1,2,3])
stack.isEmpty()
stack.pUSH(value: 10, capacity: 3)
stack.isEmpty()
stack.pOP()

//Bài 06----------------------------------------------------------------------------------------------------------------
class HinhVe{
}
class HaiChieu: HinhVe {
    var soCanh: Int
    var array: [Int]
    
    
    init(soCanh: Int, array: [Int]) {
            self.soCanh = soCanh
            self.array = array
        }
    func tinhChuVi() -> Int {
            var cv: Int = 0
            for i in array {
                cv = cv + i
            }
            return cv
        }
}
class Tron {
    var r: Float
    init(r: Float) {
        self.r = r
    }
    func tinhChuViHinhTron() -> Float {
        let pi: Float = 3.14
        return r * 2 * pi
    }
    func tinhDienTichHinhTron() -> Float {
        let pi: Float = 3.14
        return pi * pow(r, 2)
    }
    func tinhTheTichHinhTron() -> Float {
        let pi: Float = 3.14
        return pi * 2 * r
    }
}
class Vuong : HaiChieu {
    override  init(soCanh: Int, array: [Int]) {
        super.init(soCanh: soCanh, array: array)
    }
    override func tinhChuVi() -> Int {
        var cv: Int = 0
        for i in array {
            cv = cv + i
        }
        return cv
    }
    func tinhDienTichHinhVuong() -> Float {
        return Float(soCanh) * Float(soCanh)
    }
}
class Tamg : HaiChieu {
    override  init(soCanh: Int, array: [Int]) {
        super.init(soCanh: soCanh, array: array)
    }
    override func tinhChuVi() -> Int {
        var cv: Int = 0
        for i in array {
            cv = cv + i
        }
        return cv
    }
    func tinhDienTich() -> Float {
        let p: Float = Float(tinhChuVi() / 2)
        let a: Float = p * ( p - Float(super.array[0]))*( p - Float(super.array[1]) )*( p - Float(super.array[2]))
        return (sqrt(Float(a)))
    }
}
class BaChieu: HinhVe {
    var soCanh: Int
    var array: [Int]
    init(soCanh: Int, array: [Int]) {
            self.soCanh = soCanh
            self.array = array
        }
}
class LapPhuong : BaChieu {
    override  init(soCanh: Int, array: [Int]) {
        super.init(soCanh: soCanh, array: array)
    }
    func tinhDienTichHinhLapPhuong() -> Float {
        return (4*pow(Float(soCanh), 2) + 6*pow(Float(soCanh), 2))
    }
    
    func tinhTheTichHinhLapPhuong() -> Float {
        return pow(Float(soCanh), 3)
    }
    
}
class Cau {
    var r: Float
    init(r: Float) {
        self.r = r
    }
    func tinhTheTichCau() -> Float {
        let pi: Float = 3.14
        return 4/3 * pi * 3 * r
    }
}
let hinhVuong = Vuong(soCanh: 4, array: [3,3,3,3])
let tamGiac = Tamg(soCanh: 3, array: [3,4,5])
let hinhLapPhuong = LapPhuong(soCanh: 12, array: [4,4,4,4,4,4,4,4,4,4,4,4])
print("chu vi của hình vuông là: \(hinhVuong.tinhChuVi())")
print("diện tích của tam giác là: \(tamGiac.tinhDienTich())")
print("diện tích hình lập phương là: \(hinhLapPhuong.tinhDienTichHinhLapPhuong())")

//Bài 07----------------------------------------------------------------------------------------------------------------
class HocSinh{
    var hoTen: String
    var namSinh: Int
    var tongDiem: Float
    
    init(hoTen: String, namSinh: Int, tongDiem: Float) {
        self.hoTen = hoTen
        self.namSinh = namSinh
        self.tongDiem = tongDiem
    }
}

class DSHocSinh {
    var ds: [HocSinh]
    
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
        for hocSinh in ds {
            hocSinh.hoTen = hocSinh.hoTen.capitalized
        }
        return ds
    }
    
    func inKetQua(ds: [HocSinh]) -> String {
        var kq = ""
        for hs in ds {
            kq += hs.hoTen + "    \(hs.tongDiem)" + "\n"
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
print(ds.inKetQua(ds: ds.sapXep()))

//Bài 08----------------------------------------------------------------------------------------------------------------
class Date{
    var Day: Int
    var Month: Int
    var Year: Int
    var Days: [Int] = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    init(Day: Int, Month: Int, Year: Int) {
        self.Day = Day
        self.Month = Month
        self.Year = Year
    }
    
    func normalize(DD: Int, MM: Int, YY: Int) {
        var Month = (MM>=1 && MM<=12) ? MM : 1
        var Year = (YY>=1900 && YY<=2100) ? YY : 1900
        if(Month==2 && ktrNhuan(Y: Year)){
            var Day = (DD>=1&&DD<=29) ? DD : 1
        }
        else{
            var Day = (DD>=1&&DD<=Days[Month-1]) ? DD : 1
        }
    }
    func advance() {
        if( Day == daysIn(D: Day))       // Het Nam
        {
            Day=1
            Month=1
            Year+=1
        }
        else
        if((daysIn(D: Day)) != 0)             //Het Thang
        {
            Day=1
            Month+=1
        }
        else{
            Day+=1
        }
    }
    func reset(y: Int, m: Int, d: Int) {
        
    }
    func daysIn(D: Int) -> Int {
        if(Month == 2 && ktrNhuan(Y: Year)){
        return 29
        }
        return Days[Month - 1]
    }
     //   return Days[Month-1]
    func ktrNhuan(Y: Int) -> Bool {
        if (Y % 4 == 0 && Y % 100 != 0){
        return true
        }
        if (Y % 400 == 0){
        return true
        }
        return false
    }
}
let ngay01 = Date(Day: 1, Month: 1, Year: 1900)
ngay01.ktrNhuan(Y: 1988)
ngay01.normalize(DD: 12, MM: 5, YY: 1985)

//Bài 09----------------------------------------------------------------------------------------------------------------
struct Mang1c{
    var n: Int
    var a:[Int]
    
    init(n: Int, a: [Int]) {
        self.n = n
        self.a = a
    }
    func nhapMang(){
        for i in 0..<n {
       // print("nhap phan tu mang a[\(i)] = ")
        }
    }
    func xuatMang(){
        for i in 0..<n {
            print("phần tử a[\(i)] = \(a[i])")
        }
    }
    func ptuLonNhatMang() ->Int {
        var max: Int = 0
        for i in 0..<n {
            if (a[i] > max) {
                max = a[i]
            }
        }
        return max
    }
    func ptuNhoNhatMang() ->Int {
        var min: Int = a[0]
        for i in 1..<n {
            if (a[i] < min) {
                min = a[i]
            }
        }
        return min
    }
}
let a = Mang1c(n: 3, a: [10,20,30])
a.nhapMang()
a.xuatMang()
print("phần tử lớn nhất trong mảng là: \(a.ptuLonNhatMang())")
print("phần tử nhỏ nhất trong mảng là: \(a.ptuNhoNhatMang())")

//Bài 10----------------------------------------------------------------------------------------------------------------
struct A{
    var S: Int
    var n: Int
    
    init(S: Int, n: Int) {
        self.S = S
        self.n = n
    }
    mutating func tinhTong() -> Int {
        for i in 1...n {
            S+=i
        }
        return S
    }
}
var nhapn = A(S: 0, n: 10)
print("tổng số vừa nhập là: \(nhapn.tinhTong())")







