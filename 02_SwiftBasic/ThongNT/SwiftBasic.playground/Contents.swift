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
private func ptb2(a: Float, b: Float, c: Float) -> (result: String, x1: Double, x2: Double) {
    var x1: Double = 0
    var x2: Double = 0
    var result: String = ""
    
    if (a == 0) {
        if (b == 0) {
            result = "vô nghiệm"
        } else {
            result = "có một nghiệm"
            x1 = Double(-c / b)
            return (result, x1, x2)
        }
    }
    // tính delta
    let delta = b*b - 4*a*c
    // tính nghiệm
    if (delta > 0) {
        x1 = Double((-b + sqrt(delta)) / (2*a))
        x2 = Double((-b - sqrt(delta)) / (2*a))
        result = "Phương trình có 2 nghiệm"
    } else if (delta == 0) {
        x1 = Double((-b / (2 * a)))
        result = "Phương trình có nghiệm kép"
    } else {
        result = "vô nghiệm"
    }
    return (result, x1, x2)
}

//-----------------------------------//
// Bài tập 3 //
// Giải phương hệ phương trình bậc nhất 2 ẩn
private func hpt2An(a1: Float, b1: Float, c1: Float, a2: Float, b2: Float, c2: Float) -> (result: String, x: Float, y: Float) {
    var x: Float = 0
    var y: Float = 0
    var result: String = ""
    
    //tính D, Dx, Dy theo công thức
    let d = a1 * b2 - a2 * b1;
    let dx = c1 * b2 - c2 * b1;
    let dy = a1 * c2 - a2 * c1;
    if (d == 0) {
        //nếu D = 0 và Dx + Dy = 0 thì phương trình vô số nghiệm, ngược lại thì vô nghiệm
        if (dx + dy == 0) {
            result = "Hệ phương trình có vô số nghiệm"
        } else {
            result = "Hệ phương trình vô nghiệm"
        }
    }
    //tính x và y theo công thức
    else {
        x = dx / d
        y = dy / d
        result = "Hệ phương trình có nghiệm"
    }
    return(result, x, y)
}


// in kết quả
private func showAnswer(need: String) {
    switch need {
    case "ptb2":
        let answer = ptb2(a: 3, b: 4, c: 5)
        switch answer.result {
        case "vô nghiệm":
            print("Phương trình \(answer.result)")
        case "có một nghiệm":
            print("Phương trình \(answer.result):\(answer.x1)")
        default:
            print(answer.result)
        }
    case "hpt2An":
        let answer = hpt2An(a1: 5, b1: 6, c1: 7, a2: 4, b2: 5, c2: 6)
        switch answer.result {
        case "Hệ phương trình có nghiệm":
            print("\(answer.result): x = \(answer.x) và y =\(answer.y)")
        default:
            print(answer.result)
        }
    default:
        print("Yêu cầu không hợp lệ")
    }
}

//-----------------------------------//
// Bài tập 04 //
// Tính các chuỗi số


// Số Fibo thứ n
private func fibonacy(n: UInt) -> Double {
    if (n == 1 || n == 2) {
        return 1;
    }
    return fibonacy(n: n - 1) + fibonacy(n: n - 2);
}

// Tổng của 100 số Fibonacy đầu tiên
private func sumFirst100Fibo() -> Double {
    var sum: Double = 0
    for i in 1...99 {
        sum += Double(i)
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
