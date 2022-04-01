import UIKit

var str = "Hello, playground"
let pi: Double = 3.14

// * SWIFT BASIC *//
// * Từ bài 1 đến bài 4 *//
//-----------------------------------//

// Bài Tập 1 //
// tính diện tích và thể tích hình cầu
private func calculateShere(radius: Double = 0) -> (area: Double, volume: Double) {
    let area = 4 * pi * pow(radius, 2)
    let volume = 1/6 * pi * pow(radius, 3)
    return (area, volume)
}

//-----------------------------------//
// Bài tập 2 //
// tính phương trình bật 2

enum Result {
    case oneNghiem(_ x1: Double)
    case doubleNghiem(_ x1: Double)
    case twoNghiem(_ x1: Double, _ x2: Double)
    case voSoNghiem
    case voNghiem
}

private func ptb2(a: Float, b: Float, c: Float) -> Result {
    var x1: Double = 0
    var x2: Double = 0
    var result: Result
    
    if (a == 0) {
        if (b == 0) {
            result = .voNghiem
        } else {
            result = .oneNghiem(Double(-c / b))
            return result
        }
    }
    // tính delta
    let delta = b*b - 4*a*c
    // tính nghiệm
    if (delta > 0) {
        x1 = Double((-b + sqrt(delta)) / (2*a))
        x2 = Double((-b - sqrt(delta)) / (2*a))
        result = .twoNghiem(x1, x2)
    } else if (delta == 0) {
        x1 = Double((-b / (2 * a)))
        result = .doubleNghiem(x1)
    } else {
        result = .voNghiem
    }
    return result
}

//-----------------------------------//
// Bài tập 3 //
// Giải phương hệ phương trình bậc nhất 2 ẩn

enum ResultHpt {
    case voNghiem
    case voSoNghiem
    case coNghiem(_ x: Double, _ y: Double)
}

private func hpt2An(a1: Float, b1: Float, c1: Float, a2: Float, b2: Float, c2: Float) -> ResultHpt {
    var result: ResultHpt
    
    //tính D, Dx, Dy theo công thức
    let d = a1 * b2 - a2 * b1;
    let dx = c1 * b2 - c2 * b1;
    let dy = a1 * c2 - a2 * c1;
    if d == 0 {
        //nếu D = 0 và Dx + Dy = 0 thì phương trình vô số nghiệm, ngược lại thì vô nghiệm
        if (dx + dy == 0) {
            result = .voNghiem
        } else {
            result = .voSoNghiem
        }
    }
    //tính x và y theo công thức
    else {
        result = .coNghiem(Double(dx / d), Double(dy / d))
    }
    return result
}


// in kết quả

enum ShowResult {
    case ptb2
    case hpt2an
}
private func showAnswer(calculate math: ShowResult) {
    switch math {
    case .ptb2:
        let answer = ptb2(a: 3, b: 4, c: 5)
        switch answer {
        case .voNghiem:
            print("Phương trình vô nghiệm")
        case .oneNghiem(let x):
            print("Phương trình có một nghiệm:\(x)")
        case .voSoNghiem:
            print("Phương trình có vô số nghiệm")
        case .doubleNghiem(let x):
            print("Phương trình có nghiệm kép: \(x)")
        case .twoNghiem(let x1, let x2):
            print("Phương trình có 2 nghiệm là: \(x1) và \(x2)")
        }
    case .hpt2an:
        let answer = hpt2An(a1: 5, b1: 6, c1: 7, a2: 4, b2: 5, c2: 6)
        switch answer {
        case .coNghiem(let x, let y):
            print("Hệ phương trình có nghiệm: x= \(x), y = \(y)")
        case .voNghiem:
            print("Phương trình vô nghiệm")
        case .voSoNghiem:
            print("Phương trình có vô số nghiệm")
        }
    }
}

//-----------------------------------//
// Bài tập 04 //
// Tính các chuỗi số


// Số Fibo thứ n
private func fibonacy(n: UInt) -> Double {
    if n == 1 || n == 2 {
        return 1;
    }
    return fibonacy(n: n - 1) + fibonacy(n: n - 2);
}

// Tổng của 100 số Fibonacy đầu tiên
private func sumFirst100Fibo() -> Double {
    var sum: Double = 0
    for i in 1...100 {
        sum += Double(fibonacy(n: UInt(i)))
    }
    return sum
}

// Liệt kê 100 số Fibo đầu tiên
private func printFirst100Fibo() {
    for i: UInt in 1...100 {
        print(fibonacy(n: i))
    }
}



// Tính sin(x), cos(x) bằng chuỗi Taylor
private func chuoiTaylor(x: Float, n: Int) -> Double {
    // firstElement = (-1)^n
    let firstElement: Int = (n % 2 == 0) ? 1 : -1
    var temp: Float = 1
    
    for i in 1...(2 * n + 1) {
        temp = temp * x / Float(i)
    }
    return Double(firstElement) * Double(temp)
}

private func tinhChuoiTaylor(x: Float) -> (Double, Double) {
    var sin: Double = 0
    var cos: Double = 0
    var n: Int = 0
    while abs(chuoiTaylor(x: x, n: n)) > 0.001 {
        sin += chuoiTaylor(x: x, n: n)
        n += 1
    }
    cos = sqrt(1 - pow(sin, 2))
    return (sin, cos)
}

print(tinhChuoiTaylor(x: 0))

// Liệt kê các số hạnh phúc bé hơn 10.000
// Kiểm tra số hạnh phúc
private func isHappyNumber(checkNumber: Int) -> Bool {
    var arrayOfNumbers: [Int] = []
    var checkingNumber = checkNumber
    var sumHalf: Int = 0
    
    while checkingNumber > 9 {
        arrayOfNumbers.append(checkingNumber % 10)
        checkingNumber /= 10
    }
    arrayOfNumbers.append(checkingNumber)
    
    guard arrayOfNumbers.count % 2 == 0 else {
        return false
    }
    
    for index in 0...arrayOfNumbers.count/2 - 1 {
        sumHalf += arrayOfNumbers[index]
    }
    
    let result = (arrayOfNumbers.reduce(0, +) - sumHalf) == sumHalf ? true : false
    return result
}

// hàm liệc kê các số hạnh phúc dưới 10k
private func listHappyNumberUnder10k() {
    for number in 11...10000 {
        if isHappyNumber(checkNumber: number) {
            print(number)
        }
    }
}
