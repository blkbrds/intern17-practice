import UIKit

//-----------------------------------------//
// Bài tập 5, 6, 7, 8, 9 , 10 //


// Bài tập 5 //
//Xây dựng lớp Cstack cho số nguyen mô phỏng Stack //
enum STError: Error {
    case failure(String)
}

final class CStack {
    private var size: Int = 0
    private var top: Int = 0
    private var array: [Int] = []
    
    init(size: Int) {
        self.size = size
    }
    
    func isEmty() -> Bool {
        return array.isEmpty
    }
    
    func isFull() -> Bool {
        if top == size - 1 {
            return true
        }
        return false
    }
    
    func addElement(add element: Int) -> Bool {
        guard !isFull() else { return false }
        array.append(element)
        top += 1
        return true
    }
    
    func removeElement() throws -> Bool {
        guard !isEmty() else {
            throw STError.failure("empty stack")
        }
        array.remove(at: top)
        top -= 1
        return true
    }
}

// Test run //
let stackTemp = CStack(size: 2)
stackTemp.isEmty()

do {
    let _ = try stackTemp.removeElement()
} catch STError.failure(let str) {
    print(str)
}

stackTemp.isFull()
stackTemp.addElement(add: 1)
stackTemp.addElement(add: 1)
stackTemp.addElement(add: 1)
stackTemp.addElement(add: 1)


//-----------------------------------------//
// Bài tập 6 //
// Tạo class theo sơ đồ đã cho//

enum HinhHoc {
    case tron
    case vuong
    case tamGiac
    case cau
    case lapPhuong
}

class HinhVe {
    func dienTich() -> Float { return 0 }
    func chuVi() -> Float { return 0 }
}

class HaiChieu: HinhVe {
    func toString() -> String { return "" }
}

class BaChieu: HinhVe {
    func theTich() -> Float { return 0 }
    
    func toString() -> String { return "" }
}

// Thừa kế từ lớp 2 chiều
class Tron: HaiChieu {
    let pi: Float = 3.14
    var radius: Float = 0
    
    init(radius: Float) {
        self.radius = radius
    }
    
    override func dienTich() -> Float {
        return pi * pow(radius, 2)
    }
    
    override func chuVi() -> Float {
        return 2 * pi * radius
    }
    override func toString() -> String {
        return """
            =================
            Diện tích hình tròn là: \(dienTich())
            Chu vi hình tròn là: \(chuVi())
            =================
            """
    }
}

class Vuong: HaiChieu {
    var edge: Float = 0
    
    init(edge: Float) {
        self.edge = edge
    }
    
    override func dienTich() -> Float {
        return pow(edge, 2)
    }
    
    override func chuVi() -> Float {
        return 4 * edge
    }
    
    override func toString() -> String {
        return """
            =================
            Diện tích hình vuông là: \(dienTich())
            Chu vi hình vuông là: \(chuVi())
            =================
            """
    }
}

class TamGiac: HaiChieu {
    var edge1: Float, edge2: Float, edge3: Float = 0
    
    init(edge1: Float, edge2: Float, edge3: Float) {
        self.edge1 = edge1
        self.edge2 = edge2
        self.edge3 = edge3
    }
    
    override func chuVi() -> Float {
        return edge1 + edge2 + edge3
    }
    
    override func dienTich() -> Float {
        let p = chuVi() / 2
        let dienTich = sqrt(Double(p * (p - edge1) * (p - edge2) * (p - edge3)))
        return Float(dienTich.rounded())
    }
    
    override func toString() -> String {
        return """
            =================
            Diện tích hình tam giác là: \(dienTich())
            Chu vi hình tam giác là: \(chuVi())
            =================
            """
    }
}

// Thừa kế từ lớp 3 chiều
class Cau: BaChieu {
    var radius: Float = 0
    let pi: Float = 0
    
    init(radius: Float) {
        self.radius = radius
    }
        
    override func theTich() -> Float {
        return (4 / 3) * pi * pow(radius, 3)
    }
    
    override func dienTich() -> Float {
        return 4 * pi * pow(radius, 2)
    }
    
    override func toString() -> String {
        return """
            =================
            Diện tích hình cầu là: \(dienTich())
            Thể tích hình cầu là: \(theTich())
            =================
            """
    }
}

class LapPhuong: BaChieu {
    var radius: Float = 0
    
    init(radius: Float) {
        self.radius = radius
    }
    
    override func dienTich() -> Float {
        return 4 * pow(radius, 2)
    }
    
    override func theTich() -> Float {
        return pow(radius, 3)
    }
    
    override func toString() -> String {
        return """
            =================
            Diện tích hình lập phương là: \(dienTich())
            Thể tích hình lập phương là: \(theTich())
            =================
            """
    }
}

let ab = LapPhuong(radius: 3)
print(ab.toString())

//-----------------------------------------//
// Bài tập 7 //
// Tạo danh sách học sinh có tên, năm sinh, tổng điểm. Sắp xếp danh sách theo thứ tự điểm giảm dần,
// nếu bằng điểm thì năm sinh giảm dần.
class Student {
    var name: String = ""
    var yearOfBirth: Int = 1990
    var totalGrade: Float = 0
    
    init(name: String, yearOfBirth: Int, totalGrade: Float) {
        self.name = name
        self.yearOfBirth = yearOfBirth
        self.totalGrade = totalGrade
    }
}

final class Classroom {
    var studentList : [Student] = []
    
    init(listOf studentList: [Student]) {
        self.studentList = studentList
    }
    
    func sortList() {
        studentList.sort { (thisStudent, thatStudent) -> Bool in
            (thisStudent.totalGrade, thisStudent.yearOfBirth) > (thatStudent.totalGrade, thatStudent.yearOfBirth)
        }
    }
    
    func toString() {
        print("Danh sách học sinh sau khi được sắp xếp là: ")
        studentList.forEach { print("Tên: \($0.name) - sinh năm \($0.yearOfBirth). Điểm tổng là: \($0.totalGrade)") }
    }
}

// Test result
let a = Student(name: "Thong", yearOfBirth: 3100, totalGrade: 4.0)
let b = Student(name: "Thon", yearOfBirth: 3000, totalGrade: 4.0)
let c = Student(name: "Tho", yearOfBirth: 3020, totalGrade: 4.2)
let d = Student(name: "T", yearOfBirth: 3000, totalGrade: 4.2)
let e = Student(name: "Tg", yearOfBirth: 3000, totalGrade: 4.5)
let f = Student(name: "Ton", yearOfBirth: 3030, totalGrade: 4.5)
let students: [Student] = [a,b,c,d,e,f]

let classRoom : Classroom = Classroom(listOf: students)
classRoom.sortList()
classRoom.toString()



//-----------------------------------------//
// Bài tập 8 //
// Xây dựng lớp Date//
enum Months : Int {
    case January = 1
    case Febuary
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December
}

class CustomDate {
    var day: Int = 1
    var month: Months
    var year: Int = 1990
    
    init(day: Int, month: Months, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    func daysln(in month: Months) -> Int {
        switch month {
        case .January, .March, .May, .July, .August, .October, .December:
            return 31
        case .Febuary :
            return 28
        case .April, .June, .September, .November:
            return 30
        }
    }

    // Tăng ngày, tháng, năm hiện tại lên năm y, tháng m, ngày d//
    func moveDay(year: Int, month: Int, day: Int) {
        var newMonth: Int = 1
        // Cộng năm
        self.year += year

        // Cộng ngày
        if (day + self.day) <= daysln(in: Months(rawValue: newMonth) ?? Months.January) {
            self.day += day
        } else {
            if self.month.rawValue < 12 {
                self.day = self.day + day - daysln(in: self.month)
                self.month = Months(rawValue: self.month.rawValue + 1) ?? Months.January
            } else {
                self.month = .January
                self.day = self.day + day - 31
                self.year += 1
            }
        }
        
        // Cộng tháng
        if (self.month.rawValue + month) < 13 {
            newMonth = self.month.rawValue + month
            self.month = Months(rawValue: newMonth) ?? Months.January
        } else {
            self.year += 1
            newMonth = self.month.rawValue + month - 12
            self.month = Months(rawValue: newMonth) ?? Months.January
        }
    }
    
    func toString() -> String {
        return """
            =========================================
            Ngày \(day), tháng \(month), năm \(year)
            =========================================
            """
    }
}
let date = CustomDate(day: 1, month: .December, year: 1999)
date.moveDay(year: 1, month: 1, day: 32)
print(date.toString())


//-----------------------------------------//
// Bài tập 9 //
// Xây dựng mảng 1 chiều với các phần tử là số nguyên//
final class Mang1c {
    var arr : [Int] = []
    
    func printArray() {
        arr.forEach { print($0)}
    }
    
    func maxOfArry() -> Int {
        var max: Int = 0
        for value in arr {
            if value > max {
                max = value
            }
        }
        return max
    }
    
    func minOfArry() -> Int {
        var min: Int = 0
        for value in arr {
            if value < min {
                min = value
            }
        }
        return min
    }
}



//-----------------------------------------//
// Bài tập 10 //
// Tính tổng từ 1 -> n (n nguyên dương) //
final class TinhTong {
    var n: Int = 0
    var sum: Int = 0
    
    init(to n: Int) {
        self.n = n
    }
    
    func tinhTong() -> Int {
        for i in 0...n {
            sum += i
        }
        return sum
    }
}
TinhTong(to: 3).tinhTong()



