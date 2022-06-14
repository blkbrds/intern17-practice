import UIKit
import Foundation

//bài tập 1

private func dienTichAndTheTich(_ banKinh: Double) -> (dienTich: Double, theTich: Double){
    let pi = 3.14
    var s: Double = 0
    var v: Double = 0
    
    s = 4 * pi * (banKinh * banKinh)
    v = 4/3 * pi * (banKinh * banKinh * banKinh)
    
    return (s,v)
}

let sAndV = dienTichAndTheTich(5)
print("dien tich la \(sAndV.dienTich) va the tich la \(sAndV.theTich)")

// bai tập 2

private func ptb2(_ a: Double,_ b: Double,_ c: Double) -> (x1: Double, x2: Double){
    var bien1: Double = 0.0
    var bien2: Double = 0.0
    if a == 0{
        if b == 0{
            bien1 = c
        } else{
            bien2 = -c/b
        }
    }
    let delta: Double = b*b - 4*a*c
    if delta>0 {
        bien1 = (-b + (delta).squareRoot()) / 2*a
        bien2 = (-b - (delta).squareRoot()) / 2*a
    }else if delta == 0{
        bien1 = -b/(2*a)
        bien2 = bien1
    }
    
    return (bien1,bien2)
}

let tinhptb2 = ptb2(1, 5, 5)
if tinhptb2.x1 != 0{
    print("Nghiem cua phuong trinh la \(tinhptb2.x1) va \(tinhptb2.x2)")
} else {
    print("pt vo nghiem")
}

// bài tập 3

private func ptBacNhat2An(_ a1: Int, _ b1: Int, _ c1: Int, _ a2: Int, _ b2: Int, _ c2: Int) -> (x: Float, y: Float){
    print("\(a1)x + \(b1)y = \(c1)")
    print("\(a2)x + \(b2)y = \(c2)")
    
    let D = a1 * b2 - a2 * b1
    let Dx = c1 * b2 - c2 * b1
    let Dy = a1 * c2 - a2 * c1
    
    if (D == 0){
        if (Dx + Dy) == 0{
            print("Phương trình vô số nghiệm")
        } else {
            print("Phương trình vô nghiệm")
        }
    } else {
        return ((Float)(Dx / D), (Float)(Dy / D))
    }
    
    return (0,0)
    
    
}

let ptbn2An = ptBacNhat2An(3, 5, 1, 2, -1, -8)
print("Nghiệm của pt (x,y): (\(ptbn2An.x),\(ptbn2An.y))")

// bài tập 4.1 và 4.2

func fibonacci(_ n: Int) -> Int {
    var a: Int = 0
    var b: Int = 1
    var next: Int = 0
    for i in 0..<n {
        if i <= 1 {
            next = i
        } else {
            next = a + b
            a = b
            b = next
        }
    }
    return next
}
func sum(_ n: Int) -> Int {
    var sum: Int = 0
    for i in 1...n {
        sum += fibonacci(i)
        print("số thứ \(i) là: \(fibonacci(i))")
    }
    return sum
}

let tong: Int = sum(10)
print("tổng 10 số là \(tong)")


// bài tập 4.3

func tinhSinCos(x: Float, n: Int) -> Float{
    var a: Int = 0
    if n%2 == 0{
        a = 1
    }else {
        a = -1
    }
    var temp: Float = 1
    let loop: Int = 2 * n + 1
    for i in 1...loop{
        temp = temp * x / Float(i)
    }
    return (Float(a) * temp)
}

var x: Float = 0
var sin: Float = 0
var n: Int = 0
while abs(tinhSinCos(x: x, n: n)) >  0.00001{
    sin += tinhSinCos(x: x, n: n)
    n += 1
}
print("Gia tri sin can tinh: \(sin)")
print("Gia tri cos can tinh: \((1-sin*sin).squareRoot())")

// Bài tập 4.4

func soHanhPhuc(_ num: Int) -> Bool {
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
        return presum == tailsum
    } else {
        return false
    }
}
for i in 1..<10000 {
    if soHanhPhuc(i) {
        print(i)
    }
}

// bài tập 5


func timChuoi(_ str: String) -> Int {
    let character = Array(str)
    var count: Int = 0
    for i in 0..<character.count {
        if character[i] == "a" && character[i+1] == "b" {
            count += 1
        }
    }
    return count
}
let str1: String = "abaaaabbbabab"
print("Số lần xuất hiện của ab là: \(timChuoi(str1))")

// bài tập 6

let arr: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
let arr1: [Int] = arr.shuffled()
for c in arr1{
    print(c)
}

//bài tập 7

func arrayReplace(inputArray: [Int], elemToReplace: Int, substitutionElem:Int) -> [Int] {
    var outputArray: [Int] = []
    for i in inputArray{
        if i != elemToReplace{
            outputArray.append(i)
        } else {
            outputArray.append(substitutionElem)
        }
    }
    return outputArray
}

let inputArr: [Int] = [1, 4, 7, 8, 1]
let elemToReplace: Int = 1
let substitutionElem: Int = 3
arrayReplace(inputArray: inputArr, elemToReplace: elemToReplace, substitutionElem: substitutionElem)
print("Mảng mới là: \(arrayReplace(inputArray: inputArr, elemToReplace: elemToReplace, substitutionElem: substitutionElem))")
