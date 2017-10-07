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
    var username: String
    var name: [String: String]
    var photoURL: String?
    var settingsId: String
    
    init?(username: String, firstName: String, lastName: String, settingsId: String) {
        self.username = username
        self.name = ["first": firstName, "last": lastName]
        self.settingsId = settingsId
    }
}
