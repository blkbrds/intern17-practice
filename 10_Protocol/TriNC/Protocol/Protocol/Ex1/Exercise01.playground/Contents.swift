import UIKit

// MARK: - Protocol
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

// MARK: - Implement Protocol Thu
final class Bo: Thu {
    var isDi: Bool { return true }
    func ten() -> String {
        return "Con Bo Keu OOO"
    }
}

final class Heo: Thu {
    var isDi: Bool { return true }
    func ten() -> String {
        return "Heominhon"
    }
}

final class HaiCau: Thu, Ca {
    var isDi: Bool { return true }
    var isBoi: Bool { return true }
    func ten() -> String {
        return "Con HaiCau"
    }
}

final class Doi: Thu, Chim {
    var isDi: Bool { return true }
    var isBay: Bool { return true }
    func ten() -> String {
        return "Con Doi"
    }
}

final class CaSau: Thu, Ca {
    var isDi: Bool { return true }
    var isBoi: Bool { return true }
    func ten() -> String {
        return "CaSau"
    }
}


// MARK: - Implement Protocol Chim
final class Ga: Chim {
    var isBay: Bool { return true }
    func ten() -> String {
         return "Ga"
    }
}

final class Vit: Chim, Ca, Thu {
    var isBay: Bool { return true }
    var isBoi: Bool { return true }
    var isDi: Bool { return true }
    func ten() -> String {
        return "VitDonan"
    }
}


// MARK: - Implement Protocol Ca
final class CaChuon: Ca, Chim {
    var isBoi: Bool { return true }
    var isBay: Bool { return true }
    func ten() -> String {
        return "CaChuon"
    }
}

final class CaMap: Ca {
    var isBoi: Bool { return true }
    func ten() -> String {
        return "CaMap"
    }
}

let arrAnimals: [DongVat] = [Bo(), Heo(), HaiCau(), Doi(), CaSau(), Ga(), Vit(), CaChuon(), CaMap()]

enum Allanimals {
    case bietBay
    case bietBoi
    case bietDi
    case bayBoi
    case diBay
    case boiDi
    case bietCa3
    case biet1Trong3
    
    func lietkeDongVat() -> [DongVat] {
        var bietBays: [DongVat] = []
        var bietBois: [DongVat] = []
        var bietDis: [DongVat] = []
        var bayBois: [DongVat] = []
        var diBays: [DongVat] = []
        var boiDis: [DongVat] = []
        var bietCa3s: [DongVat] = []
        var biet1Trong3s: [DongVat] = []

        switch self {
        case .bietBay:
            for animal in arrAnimals {
                if animal is Chim {
                    bietBays.append(animal)
                }
            }
            return bietBays

        case .bietBoi:
            for animal in arrAnimals {
                if animal is Ca {
                    bietBois.append(animal)
                }
            }
            return bietBois

        case .bietDi:
            for animal in arrAnimals {
                if animal is Thu {
                    bietDis.append(animal)
                }
            }
            return bietDis

        case .bayBoi:
            for animal in arrAnimals {
                if animal is Chim && animal is Ca  {
                    bayBois.append(animal)
                }
            }
            return bayBois

        case .diBay:
            for animal in arrAnimals {
                if animal is Chim && animal is Thu {
                    diBays.append(animal)
                }
            }
            return diBays

        case .boiDi:
            for animal in arrAnimals {
                if animal is Ca && animal is Thu {
                    boiDis.append(animal)
                }
            }
            return boiDis

        case .bietCa3:
            for animal in arrAnimals {
                if animal is Chim && animal is Ca && animal is Thu {
                    bietCa3s.append(animal)
                }
            }
            return bietCa3s

        case .biet1Trong3:
            for animal in arrAnimals {
                if animal is Chim || animal is Ca || animal is Thu {
                    biet1Trong3s.append(animal)
                }
            }
            return biet1Trong3s
        }
    }
}

Allanimals.bietDi.lietkeDongVat()
