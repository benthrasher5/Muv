//
//  File.swift
//  Muv
//
//  Created by Ben Thrasher on 4/9/17.
//  Copyright © 2017 Ben Thrasher. All rights reserved.
//

import UIKit
import Foundation

class Muv {
    
    //MARK: Properties
    var name: String
    var photo: UIImage?
    var peopleCount: Int
    var dealsText: String?
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        
        self.name = name
        self.peopleCount = 0
    }
}
