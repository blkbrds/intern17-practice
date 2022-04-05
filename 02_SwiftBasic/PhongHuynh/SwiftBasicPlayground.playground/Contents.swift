import UIKit

// Bai tap 1
func tinhHINHCAU(r: Float) -> (s: Float, v: Float) {
    let pi = 3.14
    return (4 * Float(pi) * r * r, 4 / 3 * Float(pi) * r * r * r)
}
print("dien tich la: \(tinhHINHCAU(r: 3).s), va the tich la: \(tinhHINHCAU(r: 3).v)")

// Bai tap 2
func giaiPTBAC2(a: Float, b: Float, c: Float) {
    let delta = b * b - 4 * a * c
    let sqrtDelta = delta.squareRoot()
    if a == 0 {
        if b == 0 {
            if c == 0 {
                print("pt vo so nghiem")
            } else {
                print("pt vo nghiem")
            }
        } else {
            print("pt co 1 nghiem\(-c / b)")

        }
    } else {
        if delta < 0 {
            print("pt vo nghiem")
        } else if delta == 0 {
            print("pt co nghiem kep\(-b / 2 * a)")
        } else {
            print("nghiem x1 la \((sqrtDelta - b) / (2 * a)) va nghiem x2 la \((-sqrtDelta - b) / (2 * a ))")
        }
    }
}
giaiPTBAC2(a: 1, b: -6, c: 5)

//Bai tap 3
func hePhuongTrinh(a1: Int, a2: Int, b1: Int, b2: Int, c1: Int, c2: Int) {
    let D = a1 * b2 - a2 * b1
    let Dx = c1 * b2 - c2 * b1
    let Dy = a1 * c2 - a2 * c1
    if D == 0 {
        if Dx == Dy {
            print("phuong trinh vo so nghiem")
        } else {
            print("phuong trinh vo nghiem")
        }
    } else {
        let x = Dx / D;
        let y = Dy / D;
        print("phuong trinh co nghiem x = \(x) va y= \(y)")
    }
}
hePhuongTrinh(a1: 1, a2: 1, b1: 1, b2: 2, c1: 2, c2: 2)

//Bai tap 4
func fibonacci(n: Int) -> Int {
  if n <= 2 {
    return 1
  }
  return fibonacci(n: n - 1) + fibonacci(n:n - 2)
}

func nguyenTo(n: Int) -> Int {
    var temp: Int = Int(sqrt(Double(n)))
    
    for i in 2...temp {
        if n % i == 0{
        return 0
        }
    }
    return 1
}

func tinhTong(n: Int) -> Int {
    var s: Int = 0
    
    for i in 1...n {
        print("so fibonacci thu \(i) la \(fibonacci(n: i))")
        s+=fibonacci(n: i)
    }
    return s
}
print("tong cua n so fibonacci dau tien \(tinhTong(n: 3))")

//Bai5 tim so luong chuoi con trong chuoi me
func countSubString(_ me: String, _ con: String) -> Int {
  return me.components(separatedBy: con).count - 1
}
print("so luong chuoi con la \(countSubString("ababababababaab", "ab"))")

// Bai 6: hoan vi
 func hoanViRanDom2(array: [Int]) -> [Int] {
  var listArray: [Int] = array
  var shuffleArray: [Int] = []
  while listArray.count > 0 {
    if let randomElement = listArray.randomElement(), let index = listArray.firstIndex(of: randomElement) {
      shuffleArray.append(randomElement)
      listArray.remove(at: index)
    }
  }
  return shuffleArray
}
print(hoanViRanDom2(array: [0, 1, 2, 3, 4 , 5, 6, 7, 8, 9]))

//Bai tap 6
func hoanViRanDom(array: [Int]) -> [Int] {
    let listArray: [Int] = array
    return listArray.shuffled()
}
print(hoanViRanDom(array: [0, 1, 2, 3, 4 , 5, 6, 7, 8, 9]))

//Bai tap 7
func thayThe(inputArray: [Int], elemToReplace: Int, substitutionElem: Int) -> [Int] {
    var newArray = inputArray
    for i in 0..<inputArray.count {
        if inputArray[i] == elemToReplace {
            newArray[i] = substitutionElem
        }
    }
    return newArray
}
print(thayThe(inputArray: [1,2,1], elemToReplace: 1, substitutionElem: 3))







