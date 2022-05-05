import Foundation

var str = "Hello, playground"

func tinhDienTichVaTheTich(banKinh: Double) -> (dienTich: Double, theTich: Double) {
    
    var dienTich: Double = 0
    var theTich: Double = 0
    dienTich = Double(4 / 3 * 3.14 * banKinh * banKinh * banKinh)
    theTich = Double(4 * 3.14 * banKinh * banKinh)
    return (dienTich, theTich)
}

print("dien tich là: \(tinhDienTichVaTheTich(banKinh: 5).dienTich), the tich là: \(tinhDienTichVaTheTich(banKinh: 5).theTich)")

//bai2

func tinhPhuongTrinhBac2(a: Double, b: Double, c: Double) -> (x1: Double, x2: Double) {
    
    var x1: Double = 0
    var x2: Double = 0
    var detar: Double = 0
    detar = b * b - (4 * a * c)
    if detar < 0 {
        print("phuong trinh vo nghiem")
    } else if detar == 0 {
        let nghiemKep = -(b / 2 * a)
        print(nghiemKep)
    } else {
        x1 = (-b + detar.squareRoot()) / 2 * a
        x2 = (-b - detar.squareRoot()) / 2 * a
        print(x1, x2)
    }
    return (x1, x2)
}

print("phuong trinh bac hai la: \(tinhPhuongTrinhBac2(a: 2, b: 4, c: 2))")

//bai 3

func tinhPhuongTrinhBac1(a: Double, b: Double, c:Double, a1: Double, b1: Double, c1: Double) -> (x: Double, y: Double) {
    
    var x: Double = 0
    var y: Double = 0
    var dx: Double = 0
    var dy: Double = 0
    var d: Double = 0
    d = a * b1 - a1 * b
    dx = c * b1 - c1 * b
    dy = a * c1 - a1 * c
    x = dx / d
    y = dy / d
    return (x, y)
}

print("phương trinh bac 1 \(tinhPhuongTrinhBac1(a: 2, b: 3, c: 4, a1: 3, b1: 4, c1: 5))")

//bai4

func fibonaci(n: Int) {
    var f1 = 1
    var f2 = 0
    var sum = 0
    for _ in 0..<n {
        let f = f1 + f2
        f1 = f2
        f2 = f
        print("Fibonaci \(f2)")
        sum += f2
    }
    print("tong \(sum)")
}

print("day fibonaci là: \(fibonaci(n: 10))")

//    tinh sin cos

func chuoiTaylor(x: Float , n: Int) -> Double {
    
    let a: Int
    if n % 2 == 0 {
        a = 1
    } else {
        a = -1
    }
    var temp: Float = 1
        for i in 1..<(2 * n + 1) {
            temp = temp * x / Float(i)
        }
    return Double(a) * Double(temp)
}

private func tinhChuoi(x: Float) -> (Int, Int) {
    var sin = 0
    var cos = 0
    var n: Int = 0
    
    while abs(chuoiTaylor(x: x, n: n)) > 0.0001 {
        sin += Int(chuoiTaylor(x: x, n: n))
        n += 1
    }
    cos = Int(sqrt(Double(1 - sin * sin)))
    return (sin, cos)
}

print(tinhChuoi(x: 0))

// liêt ke so hanh phuc

func isHappyNumber(num: Int) -> Bool {
    var number = num
    var arr: [Int] = []
    
    while number > 0 {
        var surplus: Int = 0
        surplus = number % 10
        arr.append(surplus)
        number = number / 10
    }
    if arr.count % 2 == 0 {
        var presum: Int = 0
        var tailsum: Int = 0
        for i in 0..<arr.count  {
            if i < arr.count / 2 {
                presum += arr[i]
            } else {
              tailsum += arr[i]
            }
        }
        return presum == tailsum ? true : false
    } else {
        return false
    }
}
print("liet ke so hanh phuc ")

private func lietKe () {
    for i in 1...100 {
        if isHappyNumber(num: i) {
            print(i)
        }
    }
}

lietKe()

//tìm chuỗi con trong chuỗi mẹ

private func demChuoi(string: String, subString: String) -> Int {
    return string.components(separatedBy: subString).count - 1
}

print("số chuỗi con trong chuỗi mẹ: \(demChuoi(string: "abababaabsabsaab", subString: "ab"))")
    
//bài tạp 6 : hoán vị

var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
print("đảo chuỗi: \(numbers.shuffled())")

// bai tap 7

func bearrayReplace(inputArray: [Int], elemToReplayce: Int, substitutionElem: Int) -> [Int] {
    var array = inputArray
    for i in 0..<array.count {
        if array[i] == elemToReplayce {
            array[i] = substitutionElem
        }
    }
    return array
}

print("kết quả là: \(bearrayReplace(inputArray: [1, 2, 3, 1, 1], elemToReplayce: 1, substitutionElem: 6))")


