import UIKit

class DaGiac {
    var soCanhDaGiac: Int
    var mangDoLonCanhDaGiac: [Int]
    init(n: Int, mangDoLon: [Int]) {
        self.soCanhDaGiac = n
        self.mangDoLonCanhDaGiac = mangDoLon
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
