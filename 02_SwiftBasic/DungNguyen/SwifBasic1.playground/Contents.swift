import UIKit

// Bai tap 1
// Tinh dien tich va the tich hinh cau
func baiTap1(r: Float) -> (s: Float, v: Float) {
    let pi: Float = 3.14
    let s = 4 * pi * r * r
    let v = 4/3 * pi * r * r * r
    return (s, v)
}

let baiTap01 = baiTap1(r: 3)
//print(baiTap01)

// Bai tap 2
// Giai phuong trinh bac 2
enum KetquaPTB2 {
    case voNghiem
    case voSoNghiem
    case motNghiem(Float)
    case haiNghiem(Float, Float)
}

//func btb2(a: Float, b: Float, c: Float) -> KetquaPTB2 {
//    return .haiNghiem(1.0, 2.0)
//}
func baiTap2(a: Float, b: Float, c: Float) -> KetquaPTB2 {
    if a == 0 {
        if b == 0 {
            if c == 0 {
                return .voSoNghiem
            } else {
                return .voNghiem
            }
        } else {
            return .motNghiem(-c / b)
        }
    } else {
        let delta = b * b - 4 * a * c
        if delta < 0 {
            return .voNghiem
        } else if delta == 0 {
            return .motNghiem(-b/2*a)
        } else {
            let x1 = (-b + sqrt(delta)) / (2 * a)
            let x2 = (-b - sqrt(delta)) / (2 * a)
            return .haiNghiem(x1, x2)
        }
    }
}

let result = baiTap2(a: 2, b: 5, c: 3)

switch result {
case .voNghiem:
    print("PT vo nghiem")
case .voSoNghiem:
    print("PT vo so nghiem")
case .motNghiem(let x):
    print("PT co 1 nghiem x = \(x)")
case .haiNghiem(let x1, let x2):
    print("PT co 2 nghiem: x1 = \(x1) & x2 = \(x2)")
}

// Bai tap 3
// Giai he phuong trinh bac nhat 2 an

enum KetquaHPTB1 {
    case voNghiem
    case voSoNghiem
    case coNghiem(Float, Float)
}

func hptBac1(a1: Float, b1: Float, c1: Float, a2: Float, b2: Float, c2: Float) -> KetquaHPTB1 {
    let d = a1 * b2 - a2 * b1
    let dx = c1 * b2 - c2 * b1
    let dy = a1 * c2 - a2 * c1
    if d == 0 {
        if dx + dy == 0 {
            return .voSoNghiem
        } else {
            return .voNghiem
        }
    } else {
        let x = dx / d
        let y = dy / d
        return .coNghiem(x, y)
    }
}

let result1 = hptBac1(a1: 2, b1: 1, c1: 4, a2: 2, b2: -1, c2: 0)
switch result1 {
case .voNghiem:
    print("HPT vo nghiem")
case .voSoNghiem:
    print("HPT vo so nghiem")
case .coNghiem(let x, let y):
    print("HPT co nghiem (\(x), \(y))")
}

// Bai tap 4
//
func fibonacy(n: Int) -> Int {
    if n == 0 {
        return 0
    } else if n <= 2 {
        return 1
    }
    return fibonacy(n: n - 1) + fibonacy(n: n - 2)
}

//  Tong cua 10 so Fibonacy dau tien
func tongFibonacy() -> Int {
    var sum = 0
    for i in 0..<20 {
        sum += fibonacy(n: i)
    }
    return sum
}

//tongFibonacy(n: 10)

// Liet ke 10 so Fibonacy dau tien
func lkFibonacy() {
    for i in 0..<100 {
        print(fibonacy(n: i))
    }
}

//lkFibonacy()

// Tinh sin(x), cos(x) bang cong thuc chuoi Taylor
let epsilon: Float = 0.00001
// Tinh sin
func sin(x: Float) -> Float {
    var S: Float = 0
    let X: Float = x * Float.pi / 180
    var a: Float = X
    var i: Float = 3
    
    while abs(a) >= epsilon {
        S += a
        a = a * (-(X * X / ( i * (i - 1))))
        i = i + 2
    }
    return S
}

//print("Sin(30) = \(sin(x: 30))")
//print("Sin(60) = \(sin(x: 60))")
//print("Sin(90) = \(sin(x: 90))")
//print("Sin(45) = \(sin(x: 45))")

// Tinh Cos
func cos(x: Float) -> Float {
    var S: Float = 0
    let X: Float = x * Float.pi / 180
    var a: Float = 1
    var i: Float = 2
    
    while abs(a) >= epsilon {
        S += a
        a = a * (-(X * X / ( i * (i - 1))))
        i = i + 2
    }
    return S
}

//print("Cos(30) = \(cos(x: 30))")
//print("Cos(60) = \(cos(x: 60))")

// Liet ke cac so hanh phuc bes hon 10000
func soHanhPhuc(num: Int) -> Bool {
    if num == 1 || num == 7 {
        return true
    }
    var sum = num
    var x = num
    
    while sum > 9 {
        sum = 0

        while x > 0 {
            let d = x % 10
            sum += d * d
            x /= 10
        }
        if sum == 1 {
            return true
        }
        x = sum
    }
    if sum == 7 {
        return true
    }
    return false
}
 
private func lietKe() {

    for number in 11...10000 {
        if soHanhPhuc(num: number) {
            print(number)
        }
    }
}

//lietKe()

// Bai tap 5
// Tim chuoi con trong chuoi me
func duyetChuoi(chuoi1: String, chuoi2: String) -> Int {
    return chuoi1.components(separatedBy: chuoi2).count - 1
}
let dem = duyetChuoi(chuoi1: "abaaaabbba", chuoi2: "ab")
//print("So lan xuat hien cua chuoi con trong chuoi me \(dem)")

// Bai tap 6
// Hoán vị random các phần tử trong mãng
func hoanVi(array: [Int]) -> [Int] {
    return array.shuffled()
}

hoanVi(array: [1, 2, 3])

// Bai tap 7
//Given an array of integers, replace all the occurrences of elemToReplace with substitutionElem.
func arrayReplace(inputArray: [Int], elementReplace: Int, subsitutionElement: Int) -> [Int] {
    var result = inputArray
    for i in 0..<result.count {
        if result[i] == elementReplace {
            result[i] = subsitutionElement
        }
    }
    return result
}

arrayReplace(inputArray: [1,2,1], elementReplace: 1, subsitutionElement: 3)

