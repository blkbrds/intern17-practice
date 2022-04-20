import UIKit

protocol DongVat {
    
    func ten() -> String
}

protocol Thu: DongVat {
    
    var isDi: Bool { get }
}

protocol Chim: DongVat {
    
    var isBay: Bool { get }
}

protocol Ca: DongVat {
    
    var isBoi: Bool { get }
    
}

class Bo: DongVat, Thu {
    
    func ten() -> String {
        return "bo"
    }
    var isDi: Bool = true
}

class Heo: DongVat, Thu {
    
    func ten() -> String {
        return "heo"
    }
    var isDi: Bool = true
}

class HaiCau: DongVat, Thu, Ca {
    
    func ten() -> String {
        return "haicau"
    }
    var isDi: Bool = true
    var isBoi: Bool = true
}

class Doi: DongVat, Thu, Chim {
    
    func ten() -> String {
        return "doi"
    }
    var isDi: Bool = true
    var isBay: Bool = true
}

class CaSau: DongVat, Thu, Ca {
    
    func ten() -> String {
        return "ca sau"
    }
    var isDi: Bool = true
    var isBoi: Bool = true
}

class Ga: DongVat, Chim {
    
    func ten() -> String {
        return "ga"
    }
    var isBay: Bool = true
}

class Vit: DongVat, Thu, Chim, Ca {
    
    func ten() -> String {
        return "vit"
    }
    var isDi: Bool = true
    var isBay: Bool = true
    var isBoi: Bool = true
}

class CaChuon: Ca, Chim {
    func ten() -> String {
        return "ca chuon"
    }
    var isBoi: Bool = true
    var isBay: Bool = true
}

class CaMap: Ca {
    func ten() -> String {
        return "ca tre"
    }
    var isBoi: Bool = true
}

let bo = Bo()
let heo = Heo()
let haicau = HaiCau()
let doi = Doi()
let casau = CaSau()
let ga = Ga()
let vit = Vit()
let cachuon = CaChuon()
let camap = CaMap()

final class Bai01ViewController: UIViewController {
    
    // MARK: - Properties
    var array: [DongVat] = [cachuon, bo, ga, vit, camap, heo, haicau, doi, casau]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bietbay(array: array)
        bietBoi(array: array)
        bietMotTrongBa(array: array)
        vuaBoiVuaDi(array: array)
    }
    
    // MARK: - Private functions
    func bietbay(array: [DongVat]) {
        for dongvat in array where dongvat is Chim {
            print(dongvat.ten())
        }
    }
    
    func bietBoi(array: [DongVat]) {
        for dongvat in array where dongvat is Ca {
            print(dongvat.ten())
        }
    }
    
    func bietDi(array: [DongVat]) {
        for dongvat in array where dongvat is Thu {
            print(dongvat.ten())
        }
    }
    
    func bietMotTrongBa(array: [DongVat]) {
        for dongvat in array {
            if (dongvat is Chim && !(dongvat is Ca) && !(dongvat is Thu))
                || (dongvat is Ca && !(dongvat is Chim) && !(dongvat is Thu))
                || (dongvat is Thu && !(dongvat is Ca) && !(dongvat is Chim)) {
                print(dongvat.ten())
            }
        }
    }
    
    func bietcaBa(array: [DongVat]) {
        for dongvat in array {
            if dongvat is Chim && dongvat is Ca && dongvat is Thu {
                print(dongvat.ten())
            }
        }
    }
    
    func vuaBoiVuaDi(array: [DongVat]) {
        for dongvat in array {
            if !(dongvat is Chim) && dongvat is Ca && dongvat is Thu {
                print(dongvat.ten())
            }
        }
    }
    
    func vuaDiVuaBay(array: [DongVat]) {
        for dongvat in array {
            if (dongvat is Chim) && !(dongvat is Ca) && dongvat is Thu {
                print(dongvat.ten())
            }
        }
    }
    
    func vuaBayVuaBoi(array: [DongVat]) {
        for dongvat in array {
            if dongvat is Chim && dongvat is Ca && !(dongvat is Thu) {
                print(dongvat.ten())
            }
        }
    }
}
