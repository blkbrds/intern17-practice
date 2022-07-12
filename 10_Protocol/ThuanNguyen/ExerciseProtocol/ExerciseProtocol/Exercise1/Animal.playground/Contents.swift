import UIKit

protocol Animal {
    func ten() -> String
}

protocol Thu: Animal {
    var isDi: Bool {get}
}

protocol Chim: Animal {
    var isBay: Bool {get}
}

protocol Ca: Animal {
    var isBoi: Bool {get}
}

class Bo: Animal, Thu {
    func ten() -> String {
        return "bo"
    }
    var isDi: Bool = true
}

class Heo: Animal, Thu {
    func ten() -> String {
        return "heo"
    }
    var isDi: Bool = true
}

class HaiCau: Animal, Thu, Ca {
    func ten() -> String {
        return "haiCau"
    }
    var isDi: Bool = true
    var isBoi: Bool = true
}

class Doi: Animal, Thu, Chim {
    func ten() -> String {
        return "doi"
    }
    var isDi: Bool = true
    var isBay: Bool = true
}

class CaSau: Animal, Thu, Ca {
    func ten() -> String {
        return "Casau"
    }
    var isDi: Bool = true
    var isBoi: Bool = true
}

class Ga: Animal, Chim {
    func ten() -> String {
        return "Chim"
    }
    var isBay: Bool = true
}

class Vit: Animal, Thu, Chim, Ca {
    func ten() -> String {
        return "vit"
    }
    var isDi: Bool = true
    var isBay: Bool = true
    var isBoi: Bool = true
}

class CaChuon: Animal, Chim, Ca {
    func ten() -> String {
        return "Cachuon"
    }
    var isBoi: Bool = true
    var isBay: Bool = true
}

class CaMap: Animal, Ca {
    func ten() -> String {
        return "Camap"
    }
    var isBoi: Bool = true
}

let caMap = CaMap()
let caChuon = CaChuon()
let vit = Vit()
let ga = Ga()
let caSau = CaSau()
let doi = Doi()
let haiCau = HaiCau()
let heo = Heo()
let bo = Bo()

final class Exercise10 {
    
    let animalList: [Animal] = [caMap, caChuon, vit, ga, caSau, doi, haiCau, heo, bo]
    
    func bietBay() {
        for i in animalList where i is Chim {
            print(i.ten())
        }
    }
    
    func bietBoi() {
        for i in animalList where i is Ca {
            print(i.ten())
        }
    }
    
    func bietDi() {
        for i in animalList where i is Thu {
            print(i.ten())
        }
    }
    
    func vuaBayvuaBoi() {
        for i in animalList {
            if (animalList is Chim) && (animalList is Ca) && !(animalList is Thu){
                print(i.ten())
            }
        }
    }
    
    func oneInThree(animalList: [Animal]) {
            for i in animalList {
                if (i is Chim && !(i is Ca) && !(i is Thu))
                    || (i is Ca && !(i is Chim) && !(i is Thu))
                    || (i is Thu && !(i is Ca) && !(i is Chim)) {
                    print(i.ten())
                }
            }
        }
}

let vc = Exercise10()
//vc.bietBay()
//vc.bietBoi()
//vc.bietDi()
//vc.bietDi()
vc.vuaBayvuaBoi()


