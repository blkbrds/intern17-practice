import UIKit
import Darwin

// Bai 1:
func baitap1(r: Float) -> (S: Float, V: Float){
    let S = 4 * Float.pi * pow(r, 2)
    let V = (4 * Float.pi * pow(r, 3)) / 3
    
    return (S, V)
}

let kq  = baitap1(r: 5)
print("Dien tich: \(kq.S) & The tich: \(kq.V)")

// Bai 2:
enum nghiemPTB2 {
    case voNghiem
    case voSoNghiem
    case motNghiemTuyenTinh(Float)
    case motNghiemKep(Float)
    case haiNghiem(Float, Float)
}

func giaiPTB2(a: Float, b: Float, c: Float) -> nghiemPTB2{
    print("a: \(a)", "b: \(b)", "c: \(c)")
    var x1: Float = 0
    var x2: Float = 0
    var result: nghiemPTB2
    var delta: Float = 0
    
    if(a == 0){
        if(b == 0){
            if(c == 0){
                result = nghiemPTB2.voSoNghiem
            }else{
                result = nghiemPTB2.voNghiem
            }
        }else{
            result = nghiemPTB2.motNghiemTuyenTinh(-c / b)
        }
    }else{
        delta = b * b - (4 * a * c)
        if(delta < 0){
            result = nghiemPTB2.voNghiem
        }else if (delta == 0){
            x1 = -b / (2*a)
            x2 = x1
            result = nghiemPTB2.motNghiemKep(x1)
        }else{
            x1 = (-b + sqrt(delta)) / (2*a)
            x2 = (-b - sqrt(delta)) / (2*a)
            result = nghiemPTB2.haiNghiem(x1, x2)
        }
    }
    
    return result
    
}

let a = Int.random(in: 0...10)
let b = Int.random(in: 0...10)
let c = Int.random(in: 0...10)
let ptb2 = giaiPTB2(a: Float(a), b: Float(b), c: Float(c))

switch ptb2{
case .voNghiem:
    print("Vo Nghiem")
case .voSoNghiem:
    print("Vo So Nghiem")
case .motNghiemTuyenTinh(let x1):
    print("Nghiem tuyen tinh: \(x1)")
case .motNghiemKep(let x1):
    print("Nghiem kep: \(x1)")
case .haiNghiem(let x1, let x2):
    print("Hai nghiem x1 = \(x1) & x2 = \(x2)")
}

//Bai 3
enum nghiemPTB1{
    case coNghiem(Float, Float)
    case voNghiem
    case voSoNghiem
}

func giaiPTB1(a: Float, b: Float, c: Float, a1: Float, b1: Float, c1: Float) -> nghiemPTB1{
    
    var result: nghiemPTB1
    
    let d = a * b1 - a1 * b
    let dx = b * c1 - b1 * c
    let dy = c * a1 - c1 * a
    
    if(d == 0){
        if(dx + dy == 0){
            result = nghiemPTB1.voNghiem
        }else{
            result = nghiemPTB1.voSoNghiem
        }
    }else{
        result = nghiemPTB1.coNghiem((dx/d), (dy/d))
    }
    
    return result
    
}

let kqPTB1 = giaiPTB1(a: 3, b: 3, c: 1, a1: 2, b1: 1, c1: 3)

switch kqPTB1 {
case .voNghiem:
    print("Vo Nghiem")
case .coNghiem(let x, let y):
    print("Co nghiem x: \(x), y: \(y)")
case .voSoNghiem:
    print("Vo So Nghiem")
}

//Bai 4

// Fibo
func fibonacci(n:Int) ->Int
{
    if n<0 {
        return -1
    }
    if (n==0 || n==1 ) {
        return n
    }
    return fibonacci(n: n-1) + fibonacci(n: n-2)
}

//Sum Fibo
func sumFibo(n: Int) -> Int
{
    var sum: Int = 0
    for i in 0..<n
    {
        sum += fibonacci(n: i)
    }
    return sum
}
sumFibo(n: 5)

//Liet Ke Fibo
func lietKeFibo(n: Int){
    for i in 0..<n{
        print(fibonacci(n: i))
    }
}
lietKeFibo(n: 5)

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

// Number happy
func isHappy(n: Int) -> Bool {
    var set = Set<Int>()
    var num = n
    
    while num != 1 {
        guard !set.contains(num) else {
            return false
        }
        set.insert(num)
        
        var temp = 0
        while num != 0 {
            temp += (num % 10) * (num % 10)
            num = num / 10
        }
        num = temp
    }
    
    return true
}
var arrHappy: [Int] = []
for i in 0...20{
    if(isHappy(n: i)){
        arrHappy.append(i)
    }
}
print(arrHappy)

//Bai 5
func rsShowString(a: String, b: String) -> Int{
    let arr = a.components(separatedBy: b)
    return arr.count - 1
}
rsShowString(a: "abaaaabbbabababbaaabababa", b: "ab")

//Bai 6
func shuffeNumber(arrNumber: [Int]) -> [Int]{
    return arrNumber.shuffled()
}
print(shuffeNumber(arrNumber: [0,1,2,3,4,5,6,7,8,9]))

//Bai 7
func arrReplace(inputArr: [Int], elemToReplace: Int, substituation: Int) -> [Int]{
    
    var newArr: [Int] = inputArr
    
    for i in 0..<newArr.count{
        if newArr[i] == elemToReplace{
            newArr[i] = substituation
        }
    }
    return newArr
}

print(arrReplace(inputArr: [1,2,1], elemToReplace: 1, substituation: 3))
