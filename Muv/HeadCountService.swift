//
//  HeadCountService.swift
//  Muv
//
//  Created by Shabloze cock on 11/20/17.
//  Copyright © 2017 Ben Thrasher. All rights reserved.
//

import Foundation

class HeadCountService{
    
    private func getHeadCount(_ id: String, then callback: @escaping HeadCount?) -> Void {
        APIService.GET(route: "/headcount/" + id, callback: { error, data in
            if error == nil, data != nil {
                let headcount = data
                callback(headcount)
            }
        })
    }
    
}





