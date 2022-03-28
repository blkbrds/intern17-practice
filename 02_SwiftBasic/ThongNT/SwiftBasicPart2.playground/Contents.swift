import UIKit

// * SWIFT BASIC *//
// * Từ bài 5 đến bài 7 *//
//-----------------------------------//

// Bài tập 5 //
// Tìm chuỗi con trong chuỗi mẹ
private func countSubString(string: String, subString: String) -> Int {
    return string.components(separatedBy: subString).count - 1
}

countSubString(string: "Ahihi", subString: "hi")

// Bài tập 6 //
// Hoán vị ngẫu nhiên các phần tử trong mảng
private func shuffleArray(array: [Int]) -> [Int] {
    var workingArray: [Int] = array
    var shuffleArray: [Int] = []
    
    while workingArray.count > 0 {
        if let randomElement = workingArray.randomElement(), let index = workingArray.firstIndex(of: randomElement) {
            shuffleArray.append(randomElement)
            workingArray.remove(at: index)
        }
    }
    return shuffleArray
}

print(shuffleArray(array: [1,1,2,3,4,5,6,7,8,9]))

// Bài tập 7 //
// Thay thế phần tử trong mảng
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

print(changeElemInArray(array: [1,2,3,1,1,1,1,1,1,1,4], elemToReplace: 1, substitutionElem: 2))

