//
//  HomeViewModel.swift
//  CompoundExercisesTest
//
//  Created by tri.nguyen on 10/05/2022.
//

import UIKit

final class HomeViewModel {
    
    // MARK: - Properties
    var users: [User] = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        let users: [User] = [
            User(name: "Ashley", date: formatter.date(from: "1997/10/08 00:00")),
            User(name: "Tyler", date: formatter.date(from: "1998/02/05 00:00")),
            User(name: "David", date: formatter.date(from: "1996/10/07 00:00")),
            User(name: "Michael", date: formatter.date(from: "1999/03/09 00:00")),
            User(name: "Jardon", date: formatter.date(from: "1994/02/06 00:00"))
        ]
        return users
    }()
}
