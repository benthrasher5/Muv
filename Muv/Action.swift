//
//  Actions .swift
//  Muv
//
//  Created by Shabloze cock on 10/11/17.
//  Copyright © 2017 Ben Thrasher. All rights reserved.
//

import Foundation


class Action {
    
    var id: String
    var userId: String
    var muvId: String
    var datetime: String
    
    init?(id: String, userId: String, muvId: String, datetime: String) {
    
        self.id = id
        self.userId = userId
        self.muvId = muvId
        self.datetime = datetime
    
    }
    
    
}
