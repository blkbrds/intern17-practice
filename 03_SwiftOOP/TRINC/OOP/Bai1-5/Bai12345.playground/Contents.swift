import UIKit
import Foundation

// MARK: - Bai 1
final class PhanSo {
    var tu: Int
    var mau: Int
    
    init(tu: Int, mau: Int) {
        self.tu = tu
        self.mau = mau
    }
    
    func xuat() -> String {
        return "\(tu), \(mau)"
    }
    
    func cong(ps: PhanSo) -> PhanSo {
        let kqTuSo = tu * ps.mau + mau * ps.tu
        let kqmauSo = mau * ps.mau
        return PhanSo(tu: kqTuSo, mau: kqmauSo)
    }
    
    func tru(ps: PhanSo) -> PhanSo {
        let kqtuSo = tu * ps.mau - mau * ps.tu
        let kqmauSo = mau * ps.mau
        return PhanSo(tu: kqtuSo, mau: kqmauSo)
    }
    
    func nhan(ps: PhanSo) -> PhanSo {
        let kqtuSo = tu * ps.tu
        let kqmauSo = mau * ps.mau
        return PhanSo(tu: kqtuSo, mau: kqmauSo)
    }
    
    func chia(ps: PhanSo) -> PhanSo {
        let kqtuSo = tu * ps.mau
        let kqmauSo = mau * ps.tu
        return PhanSo(tu: kqtuSo, mau: kqmauSo)
    }
}

var phansoA = PhanSo(tu: 3, mau: 5)
var phansoB = PhanSo(tu: 6, mau: 7)

var kqCong = phansoA.cong(ps: phansoB)
var kqTru = phansoA.tru(ps: phansoB)
var kqNhan = phansoA.nhan(ps: phansoB)
var kqChia = phansoA.chia(ps: phansoB)

print("\(phansoA.xuat()) + \(phansoB.xuat()) = \(kqCong.xuat())")
print("\(phansoA.xuat()) - \(phansoB.xuat()) = \(kqTru.xuat())")
print("\(phansoA.xuat()) * \(phansoB.xuat()) = \(kqNhan.xuat())")
print("\(phansoA.xuat()) / \(phansoB.xuat()) = \(kqChia.xuat())")

// MARK: - Bai2, 3, 4
class DaGiac {
    var soCanh: Int = 0
    var kichThuocCacCanh: [Int] = []
    
    init?(socanh: Int, kichThuocCacCanh: [Int]) {
        guard socanh > 2 else { return nil }
        self.kichThuocCacCanh = kichThuocCacCanh
        self.soCanh = socanh
    }
    
    func chuviDaGiac() -> Int {
        return self.kichThuocCacCanh.reduce(0) { $0 + $1 }
    }
    
    func giaTriCacCanh() {
        self.kichThuocCacCanh.forEach { print($0) }
    }
    
}

class TamGiac: DaGiac {
    
    init?(kichThuocCacCanh: [Int]) {
        guard kichThuocCacCanh.count == 3 else { return nil }
        super.init(socanh: 3, kichThuocCacCanh: kichThuocCacCanh)
    }
            
    override func chuviDaGiac() -> Int {
        super.chuviDaGiac()
    }
    
    func tinhDienTich() -> Double {
        let p = chuviDaGiac() / 2
        let dientich = sqrt(Double(p * (p - kichThuocCacCanh[0]) + (p - kichThuocCacCanh[1]) + (p - kichThuocCacCanh[2])))
        return dientich
    }
    
    func pitago() -> String {
        return pow(Decimal(kichThuocCacCanh[0]), 2) + pow(Decimal(kichThuocCacCanh[1]), 2) == pow(Decimal(kichThuocCacCanh[2]), 2) ? "thoả mãn điều kiện, các cạnh của tam giác là : \(kichThuocCacCanh[0]), \(kichThuocCacCanh[1]), \(kichThuocCacCanh[2])" : "không thoả"
    }

}


// MARK: - Bai5
final class Stack<Element> {
    
    public var stacks: [Element] = []
    
    var isEmpty: Bool {
        return stacks.isEmpty
    }
    
    func checkStack(fullElement: Int) -> Bool {
        return stacks.count >= fullElement - 1 ? true : false
    }
    
    func push(_ element: Element) {
        stacks.append(element)
    }
    
    func pop() -> Element? {
        return stacks.popLast()
    }
    
    func countStack() -> Int {
        return stacks.count
    }
 }

var stack = Stack<Int>()
print("them cac phan tu vao stack")
stack.push(1)
stack.push(2)
stack.push(3)

print("dem cac phan tu \(stack.countStack())")

print("xoa phan tu vao stack ")
stack.pop()
stack.pop()
stack.pop()

