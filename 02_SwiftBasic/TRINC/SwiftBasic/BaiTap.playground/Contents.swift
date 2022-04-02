import UIKit

// MARK: - Bai 1
/// dien tich va the tich hinh cau
func dienTichvaTheTich(r: Float) -> (s: Float, v: Float) {
    let pi = 3.14
    return (4 * Float(pi) * r * r , (4/3  * Float(pi) * r * r * r))
}

// MARK: - Bai2
// GiaPT Bac2
func giaiPT(a: Float, b: Float, c: Float) {
    if a == 0 {
        if b == 0 {
            if c == 0 {
                print("phuong trinh vo so nghiem")
            } else {
                print("phuong trinh vo nghiem")
            }
        } else {
            print("phuong trinh co nghiem duy nhat \(-c/b)")
        }
    } else {
        let delta = b * b - 4 * a * c
        if (delta > 0) {
            let x1 = (-b + sqrt(delta) / (2 * a))
            let x2 = (-b - sqrt(delta) / (2 * a))
            print("nghiem thu nhat x1 = \(x1), nghiem thu hai x2 = \(x2)")
        } else if (delta == 0) {
            let sum = (-b / 2) * a
            print("phuong trinh co nghiem kep: x1 = x2 + \(sum)")
        } else {
            print("phuong tinh vo nghiem")
        }
    }
}

// MARK: - Bai 3 PTBac2 an
func ptBac2An(a1: Float, b1: Float, c1: Float, a2: Float, b2: Float, c2: Float) -> (result: String, x: Float, y: Float)  {
    
    var x: Float = 0
    var y: Float = 0
    var result: String = ""
    
    let d = a1 * b2 - a2 * b1
    let dx = c1 * b2 - c2 * b1
    let dy = a1 * c2  - a2 * c1
    
    if (d == 0) {
        if (dx * dy) ==  0 {
            result = "he phuong trinh vo so nghiem"
        } else {
            result = "he phuong trinh vo nghiem"
        }
    } else {
        x = dx / d
        y = dy / d
        result = "he phuong trinh co nghiem"
    }
    
    return (result, x, y)
}

// MARK: - Bai4: tim 100 so fibonaci va tinh tong
func isFibonnaci(n: Int) -> Int {
    if n < 0 {
        return -1
    } else if (n == 0 || n == 1) {
        return n
    } else {
        return isFibonnaci(n: n - 1) + isFibonnaci(n: n - 2) // Dequy
    }
}

var n: Int = 0
var sum: Int = 0

while (n < 100) {
    print("Day so fibbonaaci: \(isFibonnaci(n: n))")
    sum += isFibonnaci(n: n)
    n += 1
}

print("Tong 100 so fibonnaci la : \(sum)")


/// So Hanh Phuc
func soHanhPhuc(number: Int) -> Bool {
    var array: [Int] = []
    var sodu = 0
    var temp = number
    
    while(temp != 0) {
        sodu = temp % 10
        array.append(sodu)
        temp = temp / 10
        print("temp", temp)
        print("array", array)
        print("===========")
    }
    
    let countArray = array.count
    
    guard countArray % 2 == 0 else { return false }
    
    var firstSum = 0
    var lastSum = 0
    
    for index in 0...countArray - 1 {
        if index < countArray / 2 {
            firstSum += array[index]
        } else {
            lastSum += array[index]
        }
    }
    
    return firstSum == lastSum
}

soHanhPhuc(number: 4321)


// MARK: - Bai5 tim chuoi con trong chuoi me
func countSubString(_ parent: String, _ child: String) -> Int {
    return parent.components(separatedBy: child).count - 1
}

countSubString("ababababababaab", "ab")


// MARK: - Bai 6: hoan vi
 func randomArray(array: [Int]) -> [Int] {
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

print(randomArray(array: [1, 1, 2, 3, 4 , 6, 7, 8, 9]))

// MARK: - Bai7
func arrayReplace(inputArray: [Int], elementReplace: Int, subsitutionElement: Int) -> [Int] {
    var result = inputArray
    for i in 0..<result.count - 1 {
        if result[i] == elementReplace {
            result[i] = subsitutionElement
        }
    }
    return result
}


















