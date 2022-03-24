import UIKit

// MARK: - The Tich Va Dien Tich Hinh Cau
func dienTichtheTichHinhCau(r: Float) -> (s: Float, v: Float) {
    let pi = 3.14
    return (4 * Float(pi) * r * r, (4/3 * Float(pi) * r * r * r))
}


print(dienTichtheTichHinhCau(r: 2.0))


