import UIKit

protocol Thu {
    var isDi: Bool { get }
    func ten() -> String
}

protocol Chim {
    var isBay: Bool { get }
    func ten() -> String
}

protocol Ca {
    var isBoi: Bool { get }
    func ten() -> String
}

class Bo: Thu {
    
    func ten() -> String {
        return ""
    }
    var isDi: Bool = true
}

let bo = Bo()

class Heo: Thu {
    
    func ten() -> String {
        return ""
    }
    var isDi: Bool = true
}

var heo = Heo()

class HaiCau: Thu, Ca {
    
    func ten() -> String {
        return ""
    }
    var isDi: Bool = true
    var isBoi: Bool = true
}

var haicau = HaiCau()

class Doi: Thu, Chim {
    
    func ten() -> String {
        return ""
    }
    var isDi: Bool = true
    var isBay: Bool = true
}

var doi = Doi()

class CaSau: Thu, Ca {
    
    func ten() -> String {
        return ""
    }
    var isDi: Bool = true
    var isBoi: Bool = true
}

var casau = CaSau()

class Ga: Chim {
    
    func ten() -> String {
        return ""
    }
    var isBay: Bool = true
}

var ga = Ga()

class Vit: Thu, Chim, Ca {
    
    func ten() -> String {
        return ""
    }
    var isDi: Bool = true
    var isBay: Bool = true
    var isBoi: Bool = true
}

var vit = Vit()

class CaChuon: Ca, Chim {
    func ten() -> String {
        return "ca tre"
    }
    var isBoi: Bool = true
    var isBay: Bool = true
}

var cachuon = CaChuon()

class CaMap: Ca {
    func ten() -> String {
        return "ca tre"
    }
    var isBoi: Bool = true
}

let camap = CaMap()
var array: [String] = ["\(cachuon)","\(bo)","\(ga)","\(vit)","\(camap)","\(heo)","\(haicau)","\(doi)","\(casau)"]


class Bai01ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
