import Cocoa

var str = "Hello, playground"
//bai` 1
struct PhanSo {
    var tuSo: Float
    var mauSo: Float
    
    init(tuSo: Float, mauSo: Float) {
        self.tuSo = tuSo
        self.mauSo = mauSo
    }
    
    func inPhanSo() -> String {
        return "\(tuSo)/\(mauSo)"
    }
}

func nhanHaiPhanSo(x: PhanSo, y: PhanSo) -> PhanSo {
    let tu = x.tuSo * y.tuSo
    let mau = x.mauSo * y.mauSo
    return PhanSo(tuSo: tu, mauSo: mau)
}

func chiaHaiPhanSo(x: PhanSo, y: PhanSo) -> PhanSo {
    let tu = x.tuSo * y.mauSo
    let mau = x.mauSo * y.tuSo
    return PhanSo(tuSo: tu, mauSo: mau)
}

func congHaiPhanSo(x: PhanSo, y: PhanSo) -> PhanSo {
    let tu = x.tuSo * y.mauSo + x.mauSo * y.tuSo
    let mau = x.mauSo * y.mauSo
    return PhanSo(tuSo: tu, mauSo: mau)
}

func truHaiPhanSo(x: PhanSo, y: PhanSo) -> PhanSo {
    let mau = x.mauSo * y.mauSo
    let tu = x.tuSo * y.mauSo - x.mauSo * y.tuSo
    return PhanSo(tuSo: tu, mauSo: mau)
}
let x1 = PhanSo(tuSo: 2, mauSo: 4)
let x2 = PhanSo(tuSo: 1, mauSo: 2)
print("kết quả các phép tính là : nhân 2 phân số:  \(nhanHaiPhanSo(x: x1, y: x2).inPhanSo()); chia hai phân số: \(chiaHaiPhanSo(x: x1, y: x2).inPhanSo())")
print(";cộng 2 phân số:  \(congHaiPhanSo(x: x1, y: x2).inPhanSo()); trừ hai phân số: \(truHaiPhanSo(x: x1, y: x2).inPhanSo())")

//bai` 2

class DaGiac {
    var soCanh: Int
    var kichThuocCacCanh: [Int]
    
    init(soCanh: Int, kichThuocCacCanh: [Int]) {
        self.soCanh = soCanh
        self.kichThuocCacCanh = kichThuocCacCanh
    }
    
    func tinhChuvi() -> Int {
        return kichThuocCacCanh.reduce(0, +)
    }
    
    func giaTri() {
        for i in kichThuocCacCanh {
            print("kích thước các cạnh là: \(i)")
        }
    }
}

let daGiac1 = DaGiac(soCanh: 5, kichThuocCacCanh: [3, 4, 5, 6, 7])
print("Chu vi la: \(daGiac1.tinhChuvi())")
daGiac1.giaTri()
    
//bai` 3

class TamGiac : DaGiac {
    
    override func tinhChuvi() -> Int {
        guard soCanh == 3 else {
            return 0
        }
        return super.tinhChuvi()
    }
    
    func dienTich() -> Double {
        guard soCanh == 3 else {
            return 0
        }
        let a = kichThuocCacCanh[0]
        let b = kichThuocCacCanh[1]
        let c = kichThuocCacCanh[2]
        let p = (a + b + c) / 2
        let a1 = p - a
        let a2 = p - b
        let a3 = p - c
       return sqrt(Double(p * a1 * a2 * a3))
    }
}
let tamGiac1 = TamGiac(soCanh: 3, kichThuocCacCanh: [3, 4, 5])
print("chu vi tam giac la: \(tamGiac1.tinhChuvi())")
print("dien tich tam giac la: \(tamGiac1.dienTich())")

//bai` 4
func check(a: Int, b: Int, c: Int) {
    if a < b + c && b < a + c && c < b + a {
        if a * a == b * b + c * c || b * b == a * a + c * c || c * c == a * a + b * b {
                print("đây là tam giác cân (pitago)")
        } else {
            print("không thoả mãn định lý pitago")
        }
    } else {
        print("đây ko phải là 3 cạnh của tam giác ")
    }
}
check(a: 3, b: 4, c: 5)

//bai` 5

class CStack {
    var size: Int
    var top: Int = 0
    var arr: [Int] = []
    
    init(size: Int) {
        self.size = size
    }
    
    func isEmty() -> Bool {
        return top == 0
    }
    
    func isFull() -> Bool {
        return top >= size - 1
    }
    
    func push(item: Int) {
        if isFull() {
            print("ngăn xếp đã đầy ")
            return
        } else {
            top += 1
            arr.append(item)
        }
    }
    
    func pop() {
        if isEmty() {
            print("ngan xep rỗng")
            return
        } else {
            top -= 1
            arr.remove(at: top)
        }
    }
}

let testStack = CStack(size: 5)
testStack.pop()
testStack.push(item: 2)
testStack.push(item: 3)
testStack.pop()
testStack.push(item: 4)
testStack.push(item: 4)
testStack.push(item: 4)
testStack.push(item: 4)
