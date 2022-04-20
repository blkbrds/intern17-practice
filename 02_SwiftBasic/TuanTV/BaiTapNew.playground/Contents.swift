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
                default:
                    print("vo day khi nao")
                }
            }
        }
    }
}
testPTB2()



