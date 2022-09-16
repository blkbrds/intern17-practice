//
//  Bai1ViewController.swift
//  Protocol
//
//  Created by luong.tran on 13/09/2022.
//

import UIKit

class Animal {
    
    var name: String

    init(name: String) {
        self.name = name
    }

    func nameAnimal() -> String {
        return name
    }
}

protocol Chim {
    func isBay() -> Bool
}

extension Chim {
    func isBay() -> Bool {
        return true
    }
}

protocol Thu {
    func isDi() -> Bool
}

extension Thu {
    func isDi() -> Bool {
        return true
    }
}

protocol Ca {
    func isBoi() -> Bool
}

extension Ca {
    func isBoi() -> Bool {
        return true
    }
}

class CaChuon: Animal, Chim, Ca { }
class Bo: Animal, Thu { }
class Ga: Animal, Chim { }
class Vit: Animal, Thu, Chim, Ca { }
class CaMap: Animal, Ca { }
class Heo: Animal, Thu { }
class HaiCau: Animal, Thu, Ca { }
class Doi: Animal, Chim, Thu { }
class CaSau: Animal, Ca, Thu { }

let caChuon = CaChuon(name: "Cá Chuồn")
let bo = Bo(name: "Bò")
let ga = Ga(name: "Gà")
let vit = Vit(name: "Vịt")
let caMap = CaMap(name: "Cá Mập")
let heo = Heo(name: "Heo")
let haiCau = HaiCau(name: "Hải Cẩu")
let doi = Doi(name: "Dơi")
let caSau = CaSau(name: "Cá Sấu")

class Bai1ViewController: UIViewController {
    
    enum CanSomething {
        case CanOneType
        case CanTwoType
        case CanThreeType
        
        func handleSomething(animals: [Animal]) {
            switch self {
            case .CanOneType:
                for animal in animals {
                    if animal is Ca {
                        print("CanSwim", animal.nameAnimal())
                    } else if animal is Chim {
                        print("CanFly", animal.nameAnimal())
                    } else if animal is Thu {
                        print("CanWalk", animal.nameAnimal())
                    }
                }
            case .CanTwoType:
                for animal in animals {
                    if (animal is Ca && animal is Chim) {
                        print("Swim and Fly: ", animal.nameAnimal())
                    } else if (animal is Chim && animal is Thu) {
                        print("Fly and Walk: ", animal.nameAnimal())
                    } else if (animal is Thu && animal is Ca) {
                        print("Walk and Swim", animal.nameAnimal())
                    }
                }
            case .CanThreeType:
                for animal in animals {
                    if (animal is Ca && animal is Chim && animal is Thu) {
                        print("Know All: ", animal.nameAnimal())
                    }
                }
            }
        }
    }
    
    private var canSomeThing: CanSomething = .CanOneType
    private let arrayAnimal: [Animal] = [caChuon, bo, ga, vit, caMap, heo, haiCau, doi, caSau]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        canSomeThing.handleSomething(animals: arrayAnimal)
    }
    

}
