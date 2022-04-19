import UIKit

func dienTichVaTheTichHinhCau(_ R : Double) -> (S : Double, V : Double) {
    let Pi = 3.14
    let R2 = R * R
    let R3 = R * R * R
    var DienTich = 0.0
    var TheTich = 0.0
    TheTich = 4/3 * Pi * R3
    DienTich = 4 * Pi * R2
    return (S : DienTich   , V: TheTich)
}
var q = dienTichVaTheTichHinhCau(2)
print("the tich = \(q.S)")
print("dien tich = \(q.V)")



var calc = { (R : Double) -> (S : Double, V : Double) in
    let Pi = 3.14
    let R2 = R * R
    let R3 = R * R * R
    var DienTich = 0.0
    var TheTich = 0.0
    TheTich = 4/3 * Pi * R3
    DienTich = 4 * Pi * R2
    return (S : DienTich   , V: TheTich)
}
var b = calc(4)

