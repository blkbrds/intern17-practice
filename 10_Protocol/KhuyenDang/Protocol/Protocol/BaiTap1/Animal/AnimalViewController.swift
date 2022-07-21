//
//  AnimalViewController.swift
//  Protocol
//
//  Created by Khuyen Dang T.T. VN.Danang on 7/1/22.
//

import UIKit

class DongVat {
    var ten: String
    init(ten: String) { self.ten = ten }
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

class CaChuon: DongVat, Chim, Ca {
    var isBay: Bool = true
    var isBoi: Bool = true
    
    override func tenDongVat() -> String {
        return ten
    }
}

class Bo: DongVat, Thu {
    var isDi: Bool = true
    
    override func tenDongVat() -> String {
        return ten
    }
}

class Ga: DongVat, Chim {
    var isBay: Bool = true
    
    override func tenDongVat() -> String {
        return ten
    }
}

class Vit: DongVat, Chim, Thu, Ca {
    var isBay: Bool = true
    var isDi: Bool = true
    var isBoi: Bool = true
    
    override func tenDongVat() -> String {
        return ten
    }
}

class CaMap: DongVat, Ca {
    var isBoi: Bool = true
    
    override func tenDongVat() -> String {
        return ten
    }
}

class Heo: DongVat, Thu {
    var isDi: Bool = true
    
    override func tenDongVat() -> String {
        return ten
    }
}

class HaiCau: DongVat, Thu, Ca {
    var isDi: Bool = true
    var isBoi: Bool = true
    
    override func tenDongVat() -> String {
        return ten
    }
}

class Doi: DongVat, Chim, Thu {
    var isBay: Bool = true
    var isDi: Bool = true
    
    override func tenDongVat() -> String {
        return ten
    }
}

class CaSau: DongVat, Thu, Ca {
    var isDi: Bool = true
    var isBoi: Bool = true
    
    override func tenDongVat() -> String {
        return ten
    }
}

let caChuon =  CaChuon(ten: "cá chuồn")
let bo = Bo(ten: "bò")
let ga = Ga(ten: "gà")
let vit = Vit(ten: "vịt")
let caMap = CaMap(ten: "cá mập")
let heo = Heo(ten: "heo")
let haiCau = HaiCau(ten: "hải cẩu")
let doi = Doi(ten: "dơi")
let caSau = CaSau(ten: "cá sấu")

final class AnimalViewController: UIViewController {
    
    var arrDongVat: [DongVat] = [caChuon, bo, ga, vit, caMap, heo, haiCau, doi, caSau]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vuaBoiVuaDiVuaBay(arrDongVat: arrDongVat)
    }
    
    private func bietBay(arrDongVat: [DongVat]) {
        for dongvat in arrDongVat where dongvat is Chim {
            print(dongvat.tenDongVat())
        }
    }
    
    private func bietBoi(arrDongVat: [DongVat]) {
        for dongvat in arrDongVat where dongvat is Ca {
            print(dongvat.tenDongVat())
        }
    }
    
    private func bietDi(arrDongVat: [DongVat]) {
        for dongvat in arrDongVat where dongvat is Thu {
            print(dongvat.tenDongVat())
        }
    }
    
    private func vuaDiVuaBay(arrDongVat: [DongVat]) {
        for dongvat in arrDongVat where (dongvat is Thu && dongvat is Chim) {
            print(dongvat.tenDongVat())
        }
    }
    
    private func vuaBoiVuaBay(arrDongVat: [DongVat]) {
        for dongvat in arrDongVat where (dongvat is Ca && dongvat is Chim) {
            print(dongvat.tenDongVat())
        }
    }
    
    private func vuaBoiVuaDi(arrDongVat: [DongVat]) {
        for dongvat in arrDongVat where (dongvat is Ca && dongvat is Thu) {
            print(dongvat.tenDongVat())
        }
    }
    
    private func vuaBoiVuaDiVuaBay(arrDongVat: [DongVat]) {
        for dongvat in arrDongVat where (dongvat is Ca && dongvat is Thu && dongvat is Chim) {
            print(dongvat.tenDongVat())
        }
    }
    
    private func motTrongBa(arrDongVat: [DongVat]) {
        for dongvat in arrDongVat where ((dongvat is Ca && !(dongvat is Thu) && !(dongvat is Chim)) || (dongvat is Chim && !(dongvat is Thu) && !(dongvat is Ca)) || (dongvat is Thu && !(dongvat is Ca) && !(dongvat is Chim))) {
            print(dongvat.tenDongVat())
        }
    }
}
