import UIKit
import CoreGraphics

let pi: CGFloat = 3.14

// MARK: - Calculate Sphere Arean
func volume(r: CGFloat) -> CGFloat {
    let v = (4 / 3) * pi * r * r * r
    return v
}

volume(r: 4.0)

// MARK: - Calculate Spherical Arean
func sphericalArean(r: CGFloat) -> CGFloat {
    let s = 4 * pi * r * r
    return s
}

sphericalArean(r: 2.0)








