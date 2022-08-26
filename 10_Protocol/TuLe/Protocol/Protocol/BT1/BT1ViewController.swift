import UIKit

protocol Name {
    var fullName: String { get }
}

protocol Thu: Name {
    var isDi: Bool { get }
}

protocol Chim: Name {
    var isBay: Bool { get }
}

protocol Ca: Name {
    var isBoi: Bool { get }
}

struct CaChuon: Name,Chim, Ca {
    var fullName: String
    var isBay: Bool
    var isBoi: Bool
}

struct Bo: Name, Thu {
    var fullName: String
    var isDi: Bool
}

struct Ga: Name, Chim, Thu{
    var isBay: Bool
    var isDi: Bool
    var fullName: String
}

struct Vit: Name, Chim, Thu, Ca {
    var isBay: Bool
    var isDi: Bool
    var isBoi: Bool
    var fullName: String
}

final class BT1ViewController: UIViewController {
    
    static let caChuon = CaChuon(fullName: "Cá Chuồn", isBay: true, isBoi: true)
    static let bo = Bo(fullName: "Bò", isDi: true)
    static let ga = Ga(isBay: true, isDi: true, fullName: "Gà")
    static let vit = Vit(isBay: true, isDi: true, isBoi: true, fullName: "Vịt")
    let animals: [Name] = [caChuon, bo, ga, vit]

    override func viewDidLoad() {
        super.viewDidLoad()
        canFly()
    }
    
    private func canFly() {
        for animal in animals {
            if animal is Chim {
                print("\(animal.fullName)")
            }
        }
    }
    
    private func canSwin() {
        for animal in animals {
            if animal is Ca {
                print("\(animal.fullName)")
            }
        }
    }
    
    private func canWalk() {
        for animal in animals {
            if animal is Thu {
                print("\(animal.fullName)")
            }
        }
    }
    
    private func canFlyAndSwim() {
        for animal in animals {
            if animal is Chim && animal is Ca {
                print("\(animal.fullName)")
            }
        }
    }
    
    private func canSwimAndWalk() {
        for animal in animals {
            if animal is Ca && animal is Thu {
                print("\(animal.fullName)")
            }
        }
    }
    
    private func canAll() {
        for animal in animals {
            if animal is Chim && animal is Thu && animal is Ca{
                print("\(animal.fullName)")
            }
        }
    }
    
    private func oneInThree() {
        for animal in animals {
            if animal is Chim {
                print("\(animal.fullName)")
            }
        }
    }
}
