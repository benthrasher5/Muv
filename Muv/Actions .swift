//
//  Actions .swift
//  Muv
//
//  Created by Shabloze cock on 10/11/17.
//  Copyright © 2017 Ben Thrasher. All rights reserved.
//

import Foundation


class Actions{
    
    
    var userId: String
    var muvId: String
    var datetime: String
    
    init?(userId: String, muvId: String, datetime: String) {
    
        self.userId = userId
        self.muvId = muvId
        self.datetime = datetime
    
    }
    
    
}
