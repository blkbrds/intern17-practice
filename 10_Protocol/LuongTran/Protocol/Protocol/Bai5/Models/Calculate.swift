//
//  Calculate.swift
//  Protocol
//
//  Created by luong.tran on 15/09/2022.
//

import Foundation

final class Caculator {

    func add(a: Int, b: Int) -> Int {
        return a + b
    }

    func sub(a: Int, b: Int) -> Int {
        return a - b
    }

    func mul(a: Int, b: Int) -> Int {
        return a * b
    }

    func div(a: Int, b: Int) -> Int {
        return b == 0 ? 0 : a / b
    }


}
