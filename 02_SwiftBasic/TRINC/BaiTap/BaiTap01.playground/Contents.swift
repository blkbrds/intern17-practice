import UIKit


func dienTichvaTheTich(r: Float) -> (s: Float, v: Float) {
    let pi = 3.14
    return (4 * Float(pi) * r * r , (4/3  * Float(pi) * r * r * r))
}

print(dienTichvaTheTich(r: 2.0))

