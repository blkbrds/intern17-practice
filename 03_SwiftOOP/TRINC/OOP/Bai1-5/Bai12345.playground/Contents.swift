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
    
    // reduce nó cộng dồn hết các phần tử trong mảng, higher function in swift
    func chuviDaGiac() -> Int {
        kichThuocCacCanh.reduce(0) { $0 + $1 }
    }
    
    // forEach bằng for _ in trong swift
    func giaTriCacCanh() {
        kichThuocCacCanh.forEach { print($0) }
    }
}

class TamGiac: DaGiac {
    
    init?(kichThuocCacCanh: [Int]) {
        guard kichThuocCacCanh.count == 3 else { return nil }
        super.init(socanh: 3, kichThuocCacCanh: kichThuocCacCanh)
    }
    
    func tinhDienTich() -> Double {
        let p = chuviDaGiac() / 2
        let dientich = sqrt(Double(p * (p - kichThuocCacCanh[0]) * (p - kichThuocCacCanh[1]) * (p - kichThuocCacCanh[2])))
        return dientich
    }
    
    func pitago() {
        let isPitago = (kichThuocCacCanh[0] * kichThuocCacCanh[0]) + (kichThuocCacCanh[1] * kichThuocCacCanh[1]) == kichThuocCacCanh[2] * kichThuocCacCanh[2] ||
        (kichThuocCacCanh[1] * kichThuocCacCanh[1]) + (kichThuocCacCanh[2] * kichThuocCacCanh[2]) == kichThuocCacCanh[0] * kichThuocCacCanh[0] ||
        (kichThuocCacCanh[0] * kichThuocCacCanh[0]) + (kichThuocCacCanh[2] * kichThuocCacCanh[2]) == kichThuocCacCanh[1] * kichThuocCacCanh[1]
        print("Tam giac nay co phai pitago hay khong: \(isPitago)")
    }
}


// MARK: - Bai5

final class Stack {
    
    // Khởi tạo stack
    public var stacks: [Int] = []
    public var size: Int = 0
    
    init(size: Int) {
        self.size = size
    }
    
    // Kiểm tra stack có rỗng hay không
    public var isEmpty: Bool {
        stacks.isEmpty
    }
    
    // Kiểm tra stack đầy
    public func isFullStack() -> Bool {
        stacks.count == size ? true : false
    }
    
    // Thêm 1 phần tử vào stack
    public func push(_ element: Int) {
        if isFullStack() {
            print("Element \(element) can not add because stack is Full ")
        } else {
            stacks.append(element)
        }
    }
    
    // Xóa Phần tử ở đỉnh Stack
    public func pop() -> Int? {
        stacks.popLast()
    }
    
    // Đếm các phần tử stack
    public func countStack() -> Int {
        stacks.count
    }
}

var stack = Stack(size: 5)

// Thêm các phần tử vào stack
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
stack.push(5)
stack.push(6)
stack.push(11)
print(stack.stacks)

// xóa các phần tử khỏi stack
stack.pop()
stack.pop()
stack.pop()
print(stack.stacks)


