//
//  Protocol.swift
//  Protocol
//
//  Created by Tinh Bui T. VN.Danang on 5/13/22.
//

import Foundation

protocol DongVat {}

protocol Thu: DongVat {
    var isDi: Bool { get }
    func ten() -> String
}

protocol Chim: DongVat {
    var isBay: Bool { get }
    func ten() -> String
}

protocol Ca: DongVat {
    var isBoi: Bool { get }
    func ten() -> String
}

final class CaChuon: Ca, Chim {
    var isBoi: Bool { return true }
    
    func ten() -> String {
        return "ca' chuon`"
    }
    
    var isBay: Bool { return true }
}

final class Bo: Thu {
    var isDi: Bool { return true }
    
    func ten() -> String {
        return "bo`"
    }
}

final class Ga: Chim {
    var isBay: Bool { return true }
    
    func ten() -> String {
        return "ga`"
    }
}

final class Vit: Thu, Chim, Ca {
    var isDi: Bool { return true }
    var isBay: Bool { return true }
    var isBoi: Bool { return true }
    
    func ten() -> String {
        return " vit."
    }
}

final class CaMap: Ca {
    var isBoi: Bool { return true }
    
    func ten() -> String {
        return "Ca map"
    }
}

final class Heo: Thu {
    var isDi: Bool {return true}
    
    func ten() -> String {
        return "heo"
    }
}

final class HaiCau: Thu, Ca {
    var isDi: Bool { return true }
    var isBoi: Bool { return true }
    
    func ten() -> String {
        return "hai^ cau^"
    }
}

final class Doi: Thu, Chim {
    var isDi: Bool { return true }
    var isBay: Bool { return true }
    
    func ten() -> String {
        return "Doi"
    }
}

final class CaSau: Thu, Ca {
    var isDi: Bool { return true }
    var isBoi: Bool { return true }
     
    func ten() -> String {
        return "Ca' Sa^u'"
    }
}

let mangDongVat: [DongVat] = [CaChuon(), Bo(), Ga(), Vit(), CaMap(), Heo(), HaiCau(), Doi(), CaSau()]

enum HanhDong {
    case bay
    case boi
    case di
    case bayVaBoi
    case diVaBay
    case diVaBoi
    case CaBa
    case motTrongBa
    
    func lietke() -> [DongVat] {
        var bietBay: [DongVat] = []
        var bietBoi: [DongVat] = []
        var bietDi: [DongVat] = []
        var bietBayVaBoi: [DongVat] = []
        var bietBayVaDi: [DongVat] = []
        var bietBoiVaDi: [DongVat] = []
        var bietCaBa: [DongVat] = []
        var bietMotTrongBa: [DongVat] = []
  
        switch self {
        case .bay:
            for dongVat in mangDongVat {
                if dongVat is Chim {
                    bietBay.append(dongVat)
                }
            }
            return bietBay
            
        case .boi:
            for dongVat in mangDongVat {
                if dongVat is Ca {
                    bietBoi.append(dongVat)
                }
            }
            return bietBoi
            
        case .di:
            for dongVat in mangDongVat {
                if dongVat is Thu {
                    bietDi.append(dongVat)
                }
            }
            return bietDi
            
        case .bayVaBoi:
            for dongVat in mangDongVat {
                if dongVat is Chim && dongVat is Ca {
                    bietBayVaBoi.append(dongVat)
                }
            }
            return bietBayVaBoi
            
        case .diVaBay:
            for dongVat in mangDongVat {
                if dongVat is Thu && dongVat is Chim {
                    bietBayVaDi.append(dongVat)
                }
            }
            return bietBayVaDi
            
        case .diVaBoi:
            for dongVat in mangDongVat {
                if dongVat is Thu && dongVat is Ca {
                    bietBoiVaDi.append(dongVat)
                }
            }
            return bietBoiVaDi
            
        case .CaBa:
            for dongVat in mangDongVat {
                if dongVat is Thu && dongVat is Ca && dongVat is Chim  {
                    bietCaBa.append(dongVat)
                }
            }
            return bietCaBa
            
        case .motTrongBa:
            for dongVat in mangDongVat {
                if dongVat is Thu || dongVat is Ca || dongVat is Chim {
                    bietMotTrongBa.append(dongVat)
                }
            }
            return bietMotTrongBa
        }
    }
}


