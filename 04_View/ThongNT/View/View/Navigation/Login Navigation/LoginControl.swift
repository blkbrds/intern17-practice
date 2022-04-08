//
//  LoginControl.swift
//  View
//
//  Created by Thong Nguyen T. VN.Danang on 4/8/22.
//

import Foundation

protocol EditViewControllerDelegate: AnyObject {
    func sendInform(with view: EditViewController, message: String)
}

enum validateInput: String {
    case noUsername = "Chưa nhập tên đăng nhập"
    case noPassword = "Chưa nhập mật khẩu"
    case empty = "Chưa nhập dữ liệu"
    case incorrect = "Nhập sai tên đặng nhập hoặc mật khẩu"
    case correct = "Đúng tài khoản"
}

struct Accounts: Codable {
    let accounts: [Account]
}

struct Account: Codable {
    var username: String
    var password: String
}

struct User {
    var userName: String
    var password: String
    var accounts: Accounts?
    
    mutating func validateUserNamePasswordInput() -> validateInput {
        switch (userName, password) {
        case ("", ""): return .empty
        case (_, ""): return .noPassword
        case ("", _): return .noUsername
        case (_, _):
            if validatedAccount() {
                return .correct
            } else {
                return .incorrect
            }
        }
    }
    
    private mutating func getDataFromPlist() {
        guard let pathOfPlist = Bundle.main.path(forResource: "MyInfo", ofType: "plist") else { return }
        let myInfoURl: URL = URL(fileURLWithPath: pathOfPlist)
        do {
            let plistData = try Data(contentsOf: myInfoURl)
            let decode = PropertyListDecoder()
            accounts = try decode.decode(Accounts.self, from: plistData)
        } catch {
            fatalError()
        }
    }
    
    private mutating func validatedAccount() -> Bool {
        getDataFromPlist()
        guard let _ = accounts?.accounts.first(where: { $0.username == userName &&
                                                $0.password == password}) else { return false}
        return true
    }
}
