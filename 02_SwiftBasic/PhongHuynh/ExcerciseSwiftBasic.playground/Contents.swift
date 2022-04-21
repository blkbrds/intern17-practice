import UIKit
//
//// Bai tap 1
//func tinhHinhCau(r: Float) -> (s: Float, v: Float) {
//    return (4 * Float.pi * r * r, 4 / 3 * Float.pi * r * r * r)
//}
//print("dien tich la: \(tinhHinhCau(r: 3).s), va the tich la: \(tinhHinhCau(r: 3).v)")
//
//// Bai tap 2
//func giaiPTBac2(a: Float, b: Float, c: Float) {
//    let delta = b * b - 4 * a * c
//    let sqrtDelta = delta.squareRoot()
//    if a == 0 {
//        if b == 0 {
//            if c == 0 {
//                print("pt vo so nghiem")
//            } else {
//                print("pt vo nghiem")
//            }
//        } else {
//            print("pt co 1 nghiem\(-c / b)")
//
//        }
//    } else {
//        if delta < 0 {
//            print("pt vo nghiem")
//        } else if delta == 0 {
//            print("pt co nghiem kep\(-b / 2 * a)")
//        } else {
//            print("nghiem x1 la \((sqrtDelta - b) / (2 * a)) va nghiem x2 la \((-sqrtDelta - b) / (2 * a))")
//        }
//    }
//}
//giaiPTBac2(a: 1, b: -6, c: 5)
//
////Bai tap 3
//func hePhuongTrinh(a1: Int, a2: Int, b1: Int, b2: Int, c1: Int, c2: Int) {
//    let d = a1 * b2 - a2 * b1
//    let dx = c1 * b2 - c2 * b1
//    let dy = a1 * c2 - a2 * c1
//    if d == 0 {
//        if dx == dy {
//            print("phuong trinh vo so nghiem")
//        } else {
//            print("phuong trinh vo nghiem")
//        }
//    } else {
//        let x = dx / d
//        let y = dy / d
//        print("phuong trinh co nghiem x = \(x) va y= \(y)")
//    }
//}
//hePhuongTrinh(a1: 1, a2: 1, b1: 1, b2: 2, c1: 2, c2: 2)
//
////Bai tap 4
//func timSoFibonacci(n: Int) -> Int {
//  if n == 1 || n == 2 {
//    return 1
//  }
//  return timSoFibonacci(n: n - 1) + timSoFibonacci(n: n - 2)
//}
//
//func tinhTongSoFibonacci(n: Int) -> Int {
//    var s: Int = 0
//    for i in 1...n {
//        print("so fibonacci thu \(i) la \(timSoFibonacci(n: i))")
//        s += timSoFibonacci(n: i)
//    }
//    return s
//}
//print("tong cua n so fibonacci dau tien \(tinhTongSoFibonacci(n: 3))")
//
//// Bai5 tim so luong chuoi con trong chuoi me
//func countSubString(_ me: String, _ con: String) -> Int {
//  return me.components(separatedBy: con).count - 1
//}
//print("so luong chuoi con la \(countSubString("ababababababaab", "ab"))")
//
//// Bai 6: hoan vi
//func hoanViRanDom2(array: [Int]) -> [Int] {
//    var listArray: [Int] = array
//    var shuffleArray: [Int] = []
//    while listArray.count > 0 {
//        if let randomElement = listArray.randomElement(), let index = listArray.firstIndex(of: randomElement) {
//            shuffleArray.append(randomElement)
//            listArray.remove(at: index)
//        }
//    }
//  return shuffleArray
//}
//print(hoanViRanDom2(array: [0, 1, 2, 3, 4 , 5, 6, 7, 8, 9]))
//
////Bai tap 6
//func hoanViRanDom(array: [Int]) -> [Int] {
//    return array.shuffled()
//}
//print(hoanViRanDom(array: [0, 1, 2, 3, 4 , 5, 6, 7, 8, 9]))
//
////Bai tap 7
//func thayTheFromArray(inputArray: [Int], elemToReplace: Int, substitutionElem: Int) -> [Int] {
//    var newArray = inputArray
//    for i in 0..<inputArray.count {
//        if inputArray[i] == elemToReplace {
//            newArray[i] = substitutionElem
//        }
//    }
//    return newArray
//}
//print(thayTheFromArray(inputArray: [1,2,1], elemToReplace: 1, substitutionElem: 3))

var resultArray:[String] = []
let array: [String] = ["Hoà Bình", "Sơn La", "Điện Bàn", "Lai Châu", "Lào Cai", "Yên Bái", "Phú Thọ", "Hà Giang", "Tuyên Quang", "Cao Bằng", "Bắc Cạn", "Thái Nguyên", "Lạng Sơn", "Bắc Giang", "Quảng Ninh", "Hà Nội", "Bắc Ninh", "Hà Nam", "Hải Dương", "Hải Phòng", "Hưng Yên", "Nam Định", "Thái Bình", "Vĩnh Phúc", "Ninh Bình", "Thanh Hoá"]

resultArray = array.filter({ (city) -> Bool in
    return city.prefix(1).contains("H")
})
print(resultArray)
