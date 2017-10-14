//
//  User.swift
//  Muv
//
//  Created by Ben on 10/6/17.
//  Copyright © 2017 Ben Thrasher. All rights reserved.
//

import Foundation

class User {
    
    //MARK: Properties
    var id: String
    var username: String
    var firstName: String
    var lastName: String
    var photoURL: String?
    
    init?(id: String, username: String, firstName: String, lastName: String) {
        self.id = id
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
    }
}
