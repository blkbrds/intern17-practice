import Darwin
import Foundation


//ex1: tính diện tích và thể tích hình cầu
private func hinhCau(r:Float) -> (S: Float, V:Float){
    return (4.0 * Float.pi * r * r, 4.0 * Float.pi * r * r * r / 3)
}
let result = hinhCau(r: 10)
print("Dien tich hinh cau: S = \(result.S) and The tich hinh cau: V = \(result.V)")

//ex2 tính phương trình bậc 2 : ax^2 + bx + c =0 -----
private func phuongTrinh(a: Double, b: Double, c: Double) -> String {
    let delt: Double = (b * b) - (4 * a * c)
    let x1: Double
    let x2: Double
    if delt > 0 {
        x1 = (-b + sqrt(delt)) / (2 * a)
        x2 = (-b - sqrt(delt)) / (2 * a)
        return "phương trình có hai nghiệm: x1: \(x1) \t x2: \(x2)"
    } else if delt == 0 {
        x1 = (-b) / (2 * a)
        return "phương trình có nghiệm kép: x1, x2 :  \(x1)"
    }else{
        return "phương trình vô nghiệm"
    }
}
print(phuongTrinh(a: 1, b: 1, c: -6))

//ex3 giải hệ phương trình bậc nhất 2 ẩn số
private func pTbN(a1: Float, b1: Float, c1: Float, a2: Float, b2: Float, c2: Float) -> String {
    let D: Float = a1 * b2 - a2 * b1
    let Dx: Float = c1 * b2 - c2 * b1
    let Dy: Float = a1 * c2 - a2 * c1
    let x: Float
    let y: Float
    if D == 0 {
        if Dx + Dy == 0{
            return " Hệ phương trình vô số nghiệm "}
        else{
            return " Hệ phương trình vô nghiệm"}
    }
    else {
        x = Dx / D
        y = Dy / D
        return " Hệ phương trình có nghiệm (x,y) x = \(x) \t y = \(y)"
    }
}
print(pTbN(a1: 3, b1: 4, c1: 5, a2: 1, b2: 2, c2: 3))

//-------------------------------------------

//ex4: fibonaci thứ n---------------------------------
private func fibonacci(of number: Int) -> Int {
    var first = 0
    var second = 1

    for _ in 0..<number {
        let previous = first
        first = second
        second = previous + first
    }

    return first
}
print(fibonacci(of: 3))
// in ra 10 so fibonaci dau tien
private func printFibonaci(){
    var number = [Int]()
    for i in 0...10{
        let result = fibonacci(of: i)
        number.append(result)

    }
    print(" Day so fibonaci cua 10 so dau tien: \(number)")
}
printFibonaci()
// tong so fibonaci dau tien
private func totalFiboFirst() -> [Int]{
    var number = [Int]()
    for i in 0...10{
        let result = fibonacci(of: i)
        number.append(result)

    }
   return number
}
private func tong() -> Int {
    var sum = 0
    for i in totalFiboFirst() {
        sum += i
    }
    return sum
}
print(" Tong cua 10 so fibonaci dau tien:\(tong())")
//--------------------------------------------------------
//ex5 tìm chuỗi con trong chuỗi mẹ
private func subString (mom: String, child: String) -> Int {
    return mom.components(separatedBy: child).count  - 1
}
let result1 = subString(mom: "ababababaaabab", child: "ab")
print("=== sub String: \(result1)")

//ex6------------hoán vị
private func random(array: [Int]) -> [Int] {
    var listAr: [Int] = array
    var shuffleAr: [Int] = []
    
    while listAr.count > 0 {
        if let randomElement = listAr.randomElement(), let index = listAr.firstIndex(of: randomElement) {
            shuffleAr.append(randomElement)
            listAr.remove(at: index)
        }
    }
    return shuffleAr
}

print("Thứ tự các phần tử hoán vị ngẫu nhiên:",random(array: [1,2,3,4,5]))


//ex7 Thay thế phần tử trong mảng
private func changeElemInArray(array: [Int], elemToReplace: Int, substitutionElem: Int) -> [Int] {
    var arrayAfterReplace: [Int] = []
    arrayAfterReplace.append(contentsOf: array.map {
        var temp = $0
        if temp == elemToReplace {
            temp = substitutionElem
        }
        return temp
    })
    return arrayAfterReplace
}

//----------






    
        


