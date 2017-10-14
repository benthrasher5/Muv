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
    
    var id: String
    var name: String
    var description: String
    var specialText: String?
    var imageFolderURL: String?
    var location: String?
    
    init(id: String, name: String, description: String, specialText: String?, imageFolderURL: String?, location: String?) {
            self.id = id 
            self.name = name
            self.description = description
            self.specialText = specialText
            self.imageFolderURL = imageFolderURL
            self.location = location
    
    }
    
    
    
}
