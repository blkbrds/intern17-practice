//
//  Bai1ViewController.swift
//  Protocol
//
//  Created by Dung Nguyen T.T. [3] VN.Danang on 7/1/22.
//

import UIKit

class DongVat {
    
    var ten: String
    init(ten: String) {
        self.ten = ten
    }
    
    func tenDongVat() -> String {
        return ten
    }
}

protocol Thu {
    var isDi: Bool { get }
}

protocol Chim {
    var isBay: Bool { get }
}

protocol Ca {
    var isBoi: Bool { get }
}

final class CaChuon: DongVat, Ca, Chim {
        
    var isBoi: Bool = true
    var isBay: Bool = true
    
    override func tenDongVat() -> String {
        return ten
    }
}

final class Bo: DongVat, Thu {
    
    var isDi: Bool = true
    
    override func tenDongVat() -> String {
        return ten
    }
}

final class Ga: DongVat, Chim {
    
    var isBay: Bool = true
    
    override func tenDongVat() -> String {
        return ten
    }
}

final class Vit: DongVat, Chim, Thu, Ca {
    
    var isBay: Bool = true
    var isDi: Bool = true
    var isBoi: Bool = true
    
    override func tenDongVat() -> String {
        return ten
    }
}

final class CaMap: DongVat, Ca {
    
    var isBoi: Bool = true
    
    override func tenDongVat() -> String {
        return ten
    }
}

final class Heo: DongVat, Thu {
    
    var isDi: Bool = true
    
    override func tenDongVat() -> String {
        return ten
    }
}

final class HaiCau: DongVat, Thu, Ca {
    
    var isDi: Bool = true
    var isBoi: Bool = true
    
    override func tenDongVat() -> String {
        return ten
    }
}

final class Doi: DongVat, Chim, Thu {
    var isBay: Bool = true
    var isDi: Bool = true
    
    override func tenDongVat() -> String {
        return ten
    }
}

final class CaSau: DongVat, Thu, Ca {
    
    var isDi: Bool = true
    var isBoi: Bool = true
    
    override func tenDongVat() -> String {
        return ten
    }
}

let cachuon = CaChuon(ten: "cá chuồn")
let bo = Bo(ten: "bò")
let ga = Ga(ten: "gà")
let vit = Vit(ten: "vịt")
let camap = CaMap(ten: "cá mập")
let heo = Heo(ten: "heo")
let haicau = HaiCau(ten: "hải cẩu")
let doi = Doi(ten: "dơi")
let casau = CaSau(ten: "cá sấu")

final class Bai1ViewController: UIViewController {
    
    var array: [DongVat] = [cachuon, bo, ga, vit, camap, heo, haicau, doi, casau]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bietBay(array: array)
        bietCaBa(array: array)
        chiMotTrongBa(array: array)
    }
    
    private func bietBay(array: [DongVat]) {
        for dongvat in array where dongvat is Chim {
            print(dongvat.ten)
        }
    }
    
    private func bietDi(array: [DongVat]) {
        for dongvat in array where dongvat is Thu {
            print(dongvat.ten)
        }
    }
    
    private func bietBoi(array: [DongVat]) {
        for dongvat in array where dongvat is Ca {
            print(dongvat.ten)
        }
    }
    
    private func vuaBayVuaBoi(array: [DongVat]) {
        for dongvat in array where (dongvat is Chim && dongvat is Ca)  {
            print(dongvat.ten)
        }
    }
    
    private func vuaDiVuaBay(array: [DongVat]) {
        for dongvat in array where (dongvat is Thu && dongvat is Chim) {
            print(dongvat.ten)
        }
    }
    
    private func vuaBoiVuaDi(array: [DongVat]) {
        for dongvat in array where (dongvat is Ca && dongvat is Thu) {
            print(dongvat.ten)
        }
    }
    
    private func bietCaBa(array: [DongVat]) {
        for dongvat in array where (dongvat is Thu && dongvat is Ca && dongvat is Chim) {
            print(dongvat.ten)
        }
    }
    
    private func chiMotTrongBa(array: [DongVat]) {
        for dongvat in array where ((dongvat is Thu && !(dongvat is Ca) && !(dongvat is Chim)) || (dongvat is Ca && !(dongvat is Thu) && !(dongvat is Chim)) || (dongvat is Chim && !(dongvat is Ca) && !(dongvat is Thu))) {
            print(dongvat.ten)
        }
    }
}
