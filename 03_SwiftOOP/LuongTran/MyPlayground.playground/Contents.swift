import UIKit

//Phân Số
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


//Đa giác
class DaGiac{
    var canh: Int
    var arrKT: [Int]
    
    init(canh: Int, arrKT: [Int]){
        self.canh = canh
        self.arrKT = arrKT
    }
    
    func printCanhDaGiac(){
        for i in 0...canh-1{
            print("Canh thu \(i+1): \(arrKT[i])")
        }
    }
    
    func Chuvi() -> Float {
        var chuVi: Float = 0
        for i in 0...canh-1{
            chuVi += Float(arrKT[i])
        }
        return chuVi
    }
}
let daGiac: DaGiac = DaGiac(canh: 3, arrKT: [3,2,1])
daGiac.printCanhDaGiac()
print("Chu vi đa giác: \(daGiac.Chuvi())")

// Tam giac
class TamGiac: DaGiac{
    
    override func Chuvi() -> Float {
        super.Chuvi()
    }
    
    func DienTich(){
        let a: Float = Float(arrKT[0])
        let b: Float = Float(arrKT[1])
        let c: Float = Float(arrKT[2])
        
        let p = (a+b+c)/2
        let S = sqrt(p*(p-a)*(p-b)*(p-c))
        print("Dien tich tam giac: \(S)")
    }
}
let tamGiac: TamGiac = TamGiac(canh: 3, arrKT: [4,5,6])
print("Chu vi tam giác: \(tamGiac.Chuvi())")
tamGiac.DienTich()


//Định lý Pytago
class TamGiacVuong{
    var canhA: Float
    var canhB: Float
    var canhHuyen: Float
    
    init(canhA: Float, canhB: Float, canhHuyen: Float){
        self.canhA = canhA
        self.canhB = canhB
        self.canhHuyen = canhHuyen
    }
    
    func isCheckPytago(){
        let tongHaiCanh = pow(canhA, 2) + pow(canhB, 2)
        let canhHuyen = pow(canhHuyen, 2)
        
        if(canhHuyen == tongHaiCanh){
            print("Thoả mãn định lý Pytago")
        }else{
            print("Không thoả mãn định lý Pytago")
        }
    }
}

let tamGiacVuong: TamGiacVuong = TamGiacVuong(canhA: 3, canhB: 4, canhHuyen: 5)
tamGiacVuong.isCheckPytago()

//CStack
struct Stack{
    fileprivate var array: [String]
    
    init(array: [String]){
        self.array = array
    }
    
    mutating func push(element: String){
        if array.count >= 5{
            print("Stack is full")
        }else if array.count < 5{
            array.append(element)
        }
        
    }
    
    mutating func pop() -> String? {
        if(array.isEmpty){
            print("Stack is null")
        }
        return array.popLast()
    }
}

var stack: Stack = Stack(array: ["123","sgh","asd", "zxczxc", "asdasd", "zxczxc"])
print(stack.pop(), stack.pop(), stack.array)
stack.push(element: "456")
print(stack.array)
stack.push(element: "===")

//Hình Vẽ
class HinhVe{
    
    func ChuVi() -> Float{
        return 0
    }
    
    func DienTich() -> Float{
        return 0
    }
    
}

class HaiChieu: HinhVe{
    
    override func ChuVi() -> Float{
        return super.ChuVi()
    }
    
    override func DienTich() -> Float{
        return super.DienTich()
    }
    
    func Result() -> String{
        return ""
    }
    
}

class BaChieu: HinhVe{
    
    override func ChuVi() -> Float{
        return super.ChuVi()
    }
    
    override func DienTich() -> Float{
        return super.DienTich()
    }
    
    func TheTich() -> Float{
        return 0
    }
    
    func Result() -> String{
        return ""
    }
    
}

class hinhTron: HaiChieu{
    var bankinh: Float
    
    init(bankinh: Float) {
        self.bankinh = bankinh
    }
    
    override func ChuVi() -> Float{
        return 2 * bankinh * 3.14
    }
    
    override func DienTich() -> Float{
        return 3.14 * bankinh * bankinh
    }
    
    override func Result() -> String {
        return "Dien tich hinh tron: \(DienTich()), Chu vi hinh tron: \(ChuVi())"
    }
}

class hinhVuong: HaiChieu{
    var canh: Float
    
    init(canh: Float) {
        self.canh = canh
    }
    
    override func ChuVi() -> Float{
        return canh * 4
    }
    
    override func DienTich() -> Float{
        return canh * canh
    }
    
    override func Result() -> String {
        return "Dien tich hinh vuong: \(DienTich()), Chu vi hinh vuong: \(ChuVi())"
    }
}

class hinhTamGiac: HaiChieu{
    var canhA: Float
    var canhB: Float
    var canhC: Float
    
    init(canhA: Float, canhB: Float, canhC: Float){
        self.canhA = canhA
        self.canhB = canhB
        self.canhC = canhC
    }
    
    override func ChuVi() -> Float {
        return canhA + canhB + canhC
    }
    
    override func DienTich() -> Float {
        let p = (canhA+canhB+canhC)/2
        let S = sqrt(p*(p-canhA)*(p-canhB)*(p-canhC))
        return S
    }
    
    override func Result() -> String {
        return "Dien tich hinh tam giac: \(DienTich()), Chu vi hinh tam giac: \(ChuVi())"
    }
    
}

class hinhCau: BaChieu{
    
    var bankinh: Float
    
    init(bankinh: Float){
        self.bankinh = bankinh
    }
    
    override func ChuVi() -> Float {
        return 2 * bankinh * 3.14
    }
    
    override func DienTich() -> Float {
        return 4 * 3.14 * bankinh * bankinh
    }
    
    override func TheTich() -> Float {
        return 4/3 * 3.14 * pow(bankinh, 3)
    }
    
    override func Result() -> String {
        return "Dien tich hinh cau: \(DienTich()), Chu vi hinh cau: \(ChuVi()), The tich hinh cau: \(TheTich())"
    }
    
}

class hinhLapPhuong: BaChieu{
    var canh: Float
    
    init(canh: Float){
        self.canh = canh
    }
    
    override func ChuVi() -> Float {
        return 12 * canh
    }
    
    override func DienTich() -> Float {
        return canh * canh * 4
    }
    
    override func TheTich() -> Float {
        return pow(canh, 3)
    }
    
    override func Result() -> String {
        return "Dien tich hinh lap phuong: \(DienTich()), Chu vi hinh lap phuong: \(ChuVi()) , The tich hinh lap phuong: \(TheTich())"
    }
}


//Bai tap 7
class HocSinh{
    var hoTen: String
    var namSinh: Int
    var tongDiem: Float
    
    init(hoTen: String, namSinh: Int, tongDiem: Float){
        self.hoTen = hoTen
        self.namSinh = namSinh
        self.tongDiem = tongDiem
    }
}

class DanhSach{
    var listHS: [HocSinh]
    
    init(listHS: [HocSinh]){
        self.listHS = listHS
    }
    
    func SapXep()->[HocSinh]{
     
        listHS.sort{(hs1: HocSinh, hs2: HocSinh) -> Bool in
            if hs1.tongDiem > hs2.tongDiem{
                return true
            }else if hs1.tongDiem == hs2.tongDiem {
                return hs1.namSinh > hs2.namSinh
            }else{
                return false
            }
        }
        
        
        for i in listHS {
            i.hoTen = i.hoTen.capitalized
        }
        
        return listHS
    }
    
    func inString(listHS: [HocSinh]) -> String {
        var kq = ""
        for hs in listHS {
            kq += hs.hoTen + " \(hs.tongDiem)" + "\n"
        }
        return kq
    }
    
}

var hs1 = HocSinh(hoTen: "dao hoang nam", namSinh: 2000, tongDiem: 8.0)
var hs2 = HocSinh(hoTen: "dao hoang bach", namSinh: 2000, tongDiem: 9.0)
var ds = DanhSach(listHS: [hs1, hs2])
print(ds.inString(listHS: ds.SapXep()))


//Bai 8
class Date{
    var day: Int
    var month: Int
    var year: Int
    
    init(day: Int, month: Int, year: Int){
        self.day = day
        self.month = month
        self.year = year
    }
    
    func daysIn() -> Int{
        var daysIn: Int
        switch month{
        case 2:
            if(year % 4 == 0){
                daysIn = 29
            }else{
                daysIn = 28
            }
        case 4, 6, 9, 11:
            daysIn = 30
        default:
            daysIn = 31
        }
        return daysIn
    }
    
    func normalize() -> Bool{
        if (day > 31 || day < 1 || month < 1 || month > 12 || year < 1 || day > daysIn()){
            return false
        }
        return true
    }
    
    func printResutl() -> String{
        return "\(day) - \(month) - \(year)"
    }
    
    func advance(){
        day = day + 1
        if day > daysIn(){
            day = 1
            month = month + 1
            if(month > 12){
                month = 1
                year = year + 1
            }
        }
        print("Next day: \(printResutl())")
    }
}

let date: Date = Date(day: 31, month: 12, year: 1999)
if date.normalize(){
    print(date.printResutl())
    print(date.advance())
}else{
    print("Ngay k ton tai")
}
    

//Bai 9
class Mang1C{
    
    var arr1C: [Int]
    
    init(arr1C: [Int]){
        self.arr1C = arr1C
    }
    
    func printArray(){
        for i in 0..<arr1C.count{
            print("Phan tu thu \(i+1): \(arr1C[i])")
        }
    }
    
    func maxElement() -> Int{
        var empty = 0
        
        for i in 0..<arr1C.count{
            if empty < arr1C[i]{
                empty = arr1C[i]
            }
        }
        return empty
    }
    
    func minElement() -> Int{
        var empty = 0
        
        for i in 0..<arr1C.count{
            if empty > arr1C[i]{
                empty = arr1C[i]
            }
        }
        return empty
    }
    
}

let mang1C: Mang1C = Mang1C(arr1C: [4,1,2,5,0])
print(mang1C.maxElement())
print(mang1C.minElement())


// bai 10
class A{
    var soNguyen: Int
    
    init(soNguyen: Int){
        self.soNguyen = soNguyen
    }
    
    func checkN() -> Bool{
        if soNguyen < 1{
            return false
        }
        return true
    }
    
    func Sum() -> Int{
        var sum = 0
        for i in 1...soNguyen{
            sum += i
        }
        return sum
    }
}

let a: A = A(soNguyen: 1)
if a.checkN() {
    print(a.Sum())
}else{
    print("Khong phai so nguyen duong!")
}







