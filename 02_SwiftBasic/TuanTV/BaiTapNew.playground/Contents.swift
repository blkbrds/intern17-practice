import UIKit

// MARK: - Bai Tap 1

func dienTichVaTheTichHinhCau(_ R: Double) -> (S: Double, V: Double) {
    let Pi = 3.14
    let R2 = R * R
    let R3 = R * R * R
    var DienTich = 0.0
    var TheTich = 0.0
    TheTich = 4/3 * Pi * R3
    DienTich = 4 * Pi * R2
    return (S: DienTich, V: TheTich)
}
var q = dienTichVaTheTichHinhCau(2)
print("the tich = \(q.S)")
print("dien tich = \(q.V)")

var calc = { (R: Double) -> (S: Double, V: Double) in
    let Pi = 3.14
    let R2 = R * R
    let R3 = R * R * R
    var DienTich = 0.0
    var TheTich = 0.0
    TheTich = 4/3 * Pi * R3
    DienTich = 4 * Pi * R2
    return (S: DienTich, V: TheTich)
}
var b = calc(4)
// MARK: - Bai Tap 2


enum NghiemPTB22 {
    case vonghiem
    case vosonghiem
    case motnghiemtuyentinh(Float)
    case motnghiemkep(Float)
    case hainghiem(Float, Float)
}

func giaiPTB2(a: Float, b: Float, c: Float) -> NghiemPTB22 {
    var delta: Float = 0
    var nghiem = NghiemPTB22.vonghiem
    if a == 0 {
        if b == 0 {
            if c == 0 {
                nghiem = NghiemPTB22.vosonghiem
            } else {
                // c != 0
                nghiem = NghiemPTB22.vonghiem
            }
        } else {
            // b != 0
            nghiem = NghiemPTB22.motnghiemtuyentinh(-c / a)
        }
    }else {
        // a != 0
        delta = b * b - 4 * a * c
        if delta < 0 {
            nghiem = NghiemPTB22.vonghiem
        } else if delta == 0 {
            nghiem = NghiemPTB22.motnghiemkep(-b / (2 * a))
        } else {
            // delta > 0
            nghiem = NghiemPTB22.hainghiem((-b + sqrt(delta)) / (2 * a), (-b - sqrt(delta)) / (2 * a))
        }
    }
    return nghiem
}
var h = giaiPTB2(a: 1, b: -3, c: 2)
func testPTB2() {
    let thamsoA: [Float] = [-3,-2,-1,0,1,2,3]
    let thamsoB: [Float] = [-3,-2,-1,0,1,2,3]
    let thamsoC: [Float] = [-3,-2,-1,0,1,2,3]
    for a in thamsoA {
        for b in thamsoB {
            for c in thamsoC {
                //MARK: -FIX ME
                let nghiem = giaiPTB2(a: a, b: b, c: c)
                switch nghiem {
                case .vonghiem:
                    print("phuong trinh vo nghiem")
                case .motnghiemtuyentinh(let x):
                    print("phuong trinh co nghiem tuyen tinh =",x)
                case .hainghiem(let x1, let x2):
                    print("phuong trinh co 2 nghiem x1 = \(x1), x2 = \(x2)")
                case .motnghiemkep(let x):
                    print("phuong trinh co nghiem kep x = ", x)
                case .vosonghiem:
                    print("phuong trinh co vo so nghiem")
            }
        }
    }
}
}
testPTB2()

// MARK: - GIAI HE PHUONG TRINH
class PhuongTrinhBac1 {
    var a: Float
    var b: Float
    var c: Float
    init(a: Float, b: Float, c: Float) {
        self.a = a
        self.b = b
        self.c = c
    }
}
enum NghiemHPTB1 {
    case VoNghiem
    case VoSoNghiem
    case MotNghiem(Float, Float)
}
func giaiHePhuongTrinh(thamsoPT1: PhuongTrinhBac1, thamsoPT2: PhuongTrinhBac1) -> NghiemHPTB1{
    var nghiem = NghiemHPTB1.VoNghiem
    if -thamsoPT1.a / thamsoPT1.b == -thamsoPT2.a / thamsoPT2.b, thamsoPT1.c / thamsoPT1.b == thamsoPT2.c / thamsoPT2.b {
        // 2 dt trung nhau
        nghiem = NghiemHPTB1.VoSoNghiem
    } else if -thamsoPT1.a / thamsoPT1.b == -thamsoPT2.a / thamsoPT2.b, thamsoPT1.c / thamsoPT1.b != thamsoPT2.c / thamsoPT2.b {
        // 2 dt song song
        nghiem = NghiemHPTB1.VoNghiem
    } else {
        var x: Float = 0
        var y: Float = 0
        x = (thamsoPT1.c - thamsoPT1.b * y) / thamsoPT1.a
        y = (thamsoPT2.c - thamsoPT2.a * x) / thamsoPT2.b
        x = (thamsoPT1.c - thamsoPT1.b * y) / thamsoPT1.a
        nghiem = NghiemHPTB1.MotNghiem(x, y)
    }
    return nghiem
}

func testHPTB1(){
    let thamsoPT1 = PhuongTrinhBac1.init(a: 1, b: 2, c: 4)
    let thamsoPt2 = PhuongTrinhBac1.init(a: 3, b: 5, c: 9)
    let result: NghiemHPTB1 = giaiHePhuongTrinh(thamsoPT1: thamsoPT1, thamsoPT2: thamsoPt2)
    switch result {
    case .VoNghiem:
        print("he pt vo nghiem" )
    case .VoSoNghiem:
        print("he phuong trinh vo so nghiem")
    case .MotNghiem(let x, let y):
        print("he phuong trinh co nghiem x = \(x), y = \(y)")
    }
}
// MARK: -BAI TAP 4
// TONG SO 100 SO FIBONACI DAU TIEN

func fibonaci(index: Int) -> Int {
    var a = 1, b = 0
    var temp = 0
    var index = index
    while (index > 0){
        temp = a
        a = a + b
        b = temp
        index -= 1
    }
    return b
}

func tinhTongFibonaci(num: Int) -> Int{
    var i = 0
    var S = 0
    while i < num {
        S = S + fibonaci(index: i)
        i += 1
    }
    return S
}
//print("tong la", tinhTongFibonaci(num: 5))
//print("fibonaci", fibonaci(index: 0))
 
//MARK: -BT4 - Liet ke Fibonacy
// Liet ke 100 so FIBINACI dau tien

func lietkeFibonaci(num: Int) {
    var i = 0
    while i < num {
        print(fibonaci(index: i))
        i += 1
    }
}
 
lietkeFibonaci(num: 5)
 
//MARK: -BT4 - Tinh sin cos chuoi Taylor

func hesoSinXTaylor(num: Int) -> Float {
    var result: Float = 0
    var m: Float = Float(num)
    if m >= 1 {
        result = powf(-1, m - 1) / Float(tinhGiaiThua(num: (2 * Int(m) - 1)))
    } else {
        result = 0
    }
    return result
}
func tinhGiaiThua(num: Int) -> Int {
    return num < 2 ? 1 : num * tinhGiaiThua(num: num - 1)
}
func tinhSinxTaylor(x: Float, num : Int) -> Float {
    var i: Int = 1
    var calc: Float = 0
    while i <= num {
        calc = calc + hesoSinXTaylor(num: i) * powf(x, Float(2 * i - 1))
        i += 1
    }
    return calc
}
//MARK: -BT4 - Tinh cos chuoi Taylor
func hesoCosxTaylor(num: Int) -> Float {
    var result: Float = 0
    var m: Float = Float(num)
    if m >= 0 {
        result = powf(-1, m) / Float(tinhGiaiThua(num: 2 * Int(m)))
    } else {
        result = 0
    }
    return result
}
func tinhCosxTaylor(x: Float, num: Int) -> Float {
    var i: Int = 0
    var calc: Float = 0
    while i <= num {
        calc = calc + hesoCosxTaylor(num: i) * powf(x, Float(2 * i))
        i += 1
    }
    return calc
}
print(1020/100)
tinhCosxTaylor(x: 1.57, num: 4)

//MARK: -Liet ke so hanh phuc < 10000

func tinhLuyThuaSoInt(num: Int, mu: Int) -> Int {
    var a = 1
    var result = 1
    while a <= mu {
        result = result * num
        a += 1
    }
    return result
}
tinhLuyThuaSoInt(num: 2, mu: 6)
func checkSoHanhPhuc(num: Int) -> Int{
    var result: Int = 0
    var thuong: Int = 0
    var soChuSo: Int = 1
    thuong = num / 10
    while thuong >= 1 {
        soChuSo += 1
        thuong = thuong / 10
    }
    if soChuSo % 2 == 0 {
        var daySoDau: Int = 0
        var daySoDuoi: Int = 0
        var tong1: Int = 0
        var tong2: Int = 0
        daySoDuoi = num % tinhLuyThuaSoInt(num: 10, mu: soChuSo / 2)
        daySoDau = num / tinhLuyThuaSoInt(num: 10, mu: soChuSo / 2)
        while daySoDau != 0 {
            let x = daySoDau % 10
            daySoDau /= 10
            tong1 += x
        }
        while daySoDuoi != 0 {
            let y = daySoDuoi % 10
            daySoDuoi /= 10
            tong2 += y
        }
        if tong1 == tong2 {
            result = num
        } else {
            result = -1
        }
        
    } else {
        result = -1
    }
    return result
    
}
checkSoHanhPhuc(num: 11)
func lietKeSoHanhPhuc(behon num: Int) {
    var i: Int = 1
    while i < num {
        let result = checkSoHanhPhuc(num: i)
        if result != -1 {
            print(result)
        }
        i += 1
    }
}
lietKeSoHanhPhuc(behon: 10000)

//MARK: -BT5
func demSoLuongChuoiConTrongChuoiMe(chuoiMe: String) -> Int {
    var chuoiMe = chuoiMe
    var arrChuoiCon = chuoiMe.components(separatedBy: "ab")
    return arrChuoiCon.count - 1
}
//MARK: -BT6
func hienThiNgauNhienMang(arr : [Int]) -> [Int]{
    return arr.shuffled()
}
print(hienThiNgauNhienMang(arr: [0,1,2,3,4,5,6,7,8,9]))
//MARK: -BT7
func replaceElement(arr: [Int],elementToReplace: Int, substitutionReplace: Int ) -> [Int]{
    return arr.map({
        value in
        if value == elementToReplace {
            return substitutionReplace
        }
        return value
    })
}
replaceElement(arr: [1,2,1], elementToReplace: 1, substitutionReplace: 3)



