import UIKit
// Bài tập 1
func baiTap1(r: Double) ->(dientich: Double, thetich: Double) {
    let pi =  3.14159
    let dientich = 4 * pi * r * r
    let thetich = 4/3 * pi * r * r * r
    return(dientich, thetich)
}
let kq = baiTap1(r: 5)
print("Dien tich \(kq.dientich) va the tich \(kq.thetich)")

//Bài tập 2: Giải phương trình bậc 2

func giaiPTBac2(a: Double, b: Double, c: Double)-> KetquaPTB2 {
    let delta = b*b - 4*a*c;
    if a==0 {
        if b==0 {
            if c==0 {
                return .voSoNghiem
            } else {
                return .voNghiem
            }
        } else {
            return .motNghiem(-c/b)
        }
    } else {
        if delta < 0 {
            return .voNghiem
        } else if delta > 0 {
            return .haiNghiem((-b + sqrt(delta)) / (2*a), ( -b - sqrt(delta)) / (2 * a))
        } else {
            return .motNghiem( -b / 2 * a)
        }
    }
}
let ptb2 = giaiPTBac2(a: 2, b: 5, c: 3)
switch ptb2 {
case .voNghiem:
    print("PT vo nghiem")
case .voSoNghiem:
    print("PT vo so nghiem")
case .motNghiem(let x):
    print("PT co 1 nghiem x = \(x)")
case .haiNghiem(let x1, let x2):
    print("PT co 2 nghiem: x1 = \(x1) & x2 = \(x2)")
}
enum KetquaPTB2 {
    case voNghiem
    case voSoNghiem
    case motNghiem(Double)
    case haiNghiem(Double, Double)
}

// Bài tập 3
enum KetquaPTB1
{
    case voNghiem
    case voSoNghiem
    case coNghiem(Double, Double)
}
func giaiPTB1(a1: Int, b1 : Int, c1: Int, a2 : Int, b2: Int, c2: Int) -> KetquaPTB1 {
    let D: Int = a1 * b2 - a2 * b1
    let Dx: Int = c1 * b2 - c2 * b1
    let Dy: Int = a1 * c2 - a2 * c1

    if D == 0 {
        if Dx + Dy == 0 {
            return .voSoNghiem
        }
        else {
            return .voNghiem
        }
    } else {
        let x: Double = Double(Dx / D)
        let y: Double = Double(Dy / D)
        return .coNghiem(x, y)
    }
}
let result = giaiPTB1(a1: 2, b1: 1, c1: 4, a2: 3, b2: 2, c2: 7)
switch result {
case .voNghiem:
    print("PT vo nghiem")
case .voSoNghiem:
    print("PT vo so nghiem")
case .coNghiem(let x, let y):
    print("PT co 2 nghiem: x = \(x) & y = \(y)")
}

// Bài tập 4
// Fibo
func fibonaci(n:Int) ->Int
{
    if n<0 {
        return -1
    }
    if (n==0 || n==1 ) {
        return n
    }
    return fibonaci(n: n-1) + fibonaci(n: n-2)
}

//----Tính tổng 10 số
func tinhTong(n: Int) -> Int
{
    var sum: Int = 0
    for i in 0..<n
    {
        sum += fibonaci(n: i)
    }
    return sum
}
let tong = tinhTong(n: 10)

//---- In ra 10 số
func lietKeFibo(n: Int)
{
    for a in 0..<n {
        print(fibonaci(n: a))
    }
}
let kqlietke = lietKeFibo(n: 10)

//Tính sin(x) bằng chuỗi Taylor

let epsilon: Float = 0.000001
func sin(x: Float) -> Float {
    var S: Float = 0
    let X: Float = x * Float.pi / 180
    var a: Float = X
    var i: Float = 3
    while abs(a) >= epsilon {
        S += a
        a = a * (-(X * X / (i * (i - 1))))
        i += 2
    }
    return S
}
print("Sin(30) = \(sin(x:30))")
print("Sin(60) = \(sin(x:60))")
print("Sin(90) = \(sin(x:90))")
print("Sin(45) = \(sin(x:45))")

//Tính cos(x) bằng chuỗi Taylor

func cos(x: Float) -> Float {
    var S: Float = 0
    let X: Float = x * Float.pi / 180
    var a: Float = 1
    var i: Float = 2
    while abs(a) >= epsilon {
        S += a
        a = a * (-(X*X/(i*(i-1))))
        i += 2
    }
    return S
}
print("Cos(30) = \(cos(x:30))")
print("Cos(60) = \(cos(x:60))")
print("Cos(90) = \(cos(x:90))")
print("Cos(45) = \(cos(x:45))")

//Số hạnh phúc

func isHappy(n: Int) -> Bool {
    var result: Bool = false
    var prevSums: [Int] = []
    var _number = n
    while !result && !prevSums.contains(_number) {
        prevSums += [_number]
        var sum:Double = 0
        while _number>0 {
            sum += pow(Double(_number%10), 2.0)
            _number = _number / 10
        }
        if sum == 1 {
            result = true
        } else {
            _number = Int(sum)
        }
    }
    return result
}
for i in 0..<100
{
    if isHappy(n: i) == true {
        print(i)
    }
}

// Bài tập 5

func Count(a:String,b:String) -> Int{
    let tok = a.components(separatedBy: b)
    return tok.count-1
}
let dem = Count(a: "abaaaabbbabababbaaabababa", b: "ab")

// Bài tập 6

//xáo trộn mảng
func baiTap6(a: [Int]) -> [Int] {
    var numbers = a
    numbers.shuffle()
    return numbers
}
let ketqua = baiTap6(a: [0, 1, 2, 3])

// Bài tập 7

func baiTap7(a: [Int], elemToReplace: Int, substitutionElem: Int) -> [Int] {
    var newArray: [Int] = []
    for i in a
    {
        if i == elemToReplace {
            newArray.append(substitutionElem)
        }
        else {
            newArray.append(i)
        }
    }
    return newArray
}
let thaythe = baiTap7(a: [1, 2, 1], elemToReplace: 1, substitutionElem: 3)
