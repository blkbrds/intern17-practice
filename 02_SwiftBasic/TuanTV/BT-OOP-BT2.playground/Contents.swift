import UIKit

class DaGiac {
    var soCanhDaGiac: Int
    var mangDoLonCanhDaGiac: [Int]
    init(n: Int, mangDoLon: [Int]) {
        self.soCanhDaGiac = n
        self.mangDoLonCanhDaGiac = Array(mangDoLon[0..<n])
    }
    func tinhChuVi() -> Int{
        var chuVi: Int = 0
        for doLonCanh in mangDoLonCanhDaGiac {
            chuVi = chuVi + doLonCanh
        }
        return chuVi
        
    }
    func inGiaTriCacCanh(){
        for (index,doLonCanh) in mangDoLonCanhDaGiac.enumerated() {
            print("do lon cua canh thu \(index) = \(doLonCanh)")
        }
    }
}

DaGiac.init(n: 3, mangDoLon: [1,2,3]).inGiaTriCacCanh()

class TamGiac: DaGiac {
    
    func tinhDienTichTamGiac() {
        var chuVi: Float = Float(tinhChuVi())
        chuVi = sqrt(chuVi * (chuVi - Float(mangDoLonCanhDaGiac[0])) * (chuVi - Float(mangDoLonCanhDaGiac[1])) * (chuVi - Float(mangDoLonCanhDaGiac[2])))
    }
    
    func inCacCanhTamGiacPitago(dsTamGiac: [TamGiac]) {
        for tamGiac in dsTamGiac {
            var canhA = 0
            var canhB = 0
            var canhC = 0
            canhA = tamGiac.mangDoLonCanhDaGiac[0]
            canhB = tamGiac.mangDoLonCanhDaGiac[1]
            canhC = tamGiac.mangDoLonCanhDaGiac[2]
            if canhA * canhA == canhB * canhB + canhC * canhC ||
                canhB * canhB == canhA * canhA + canhC * canhC ||
                canhC * canhC == canhA * canhA + canhB * canhB {
                print("canh A = ", canhA)
                print("canh B = ", canhB)
                print("canh C = ", canhC)
            }
        }
    }
    
}
TamGiac(n: 3, mangDoLon: [1,2,3]).inCacCanhTamGiacPitago(dsTamGiac: [TamGiac(n: 3, mangDoLon: [1,2,3]), TamGiac(n: 3, mangDoLon: [3,4,5]), TamGiac(n: 3, mangDoLon: [1,2,1])])
class CStack {
    var size: Int
    var top: Int
    var stack: [Int]
    init(size: Int, top: Int, stack: [Int]) {
        self.size = size
        self.top = top
        self.stack = stack
    }
    
    func isEmpty() -> Bool {
        return top == 0 ? true : false
    }
    
    func isFull() -> Bool {
        return top == size ? true : false
    }
    
    func push(item: Int) {
        if isFull() {
            print("stack is full")
        } else {
            top += 1
            stack[top] = item
        }
    }
    
    func pop(item: Int) {
        if isEmpty() {
            print("stack is empty")
        } else {
            stack[top] = 0
        }
    }
    
    

    
}
