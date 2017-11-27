//
//  HeadCountService.swift
//  Muv
//
//  Created by Shabloze cock on 11/20/17.
//  Copyright © 2017 Ben Thrasher. All rights reserved.
//

import Foundation

class HeadCountService{
    
    static func getHeadCount(_ id: String, then callback: @escaping (Int?) -> Void) {
        APIService.GET(route: "/headcount/" + id, callback: { error, data in
            if error == nil, data != nil {
                let headcount = parseHeadcount(from: data!)
                callback(headcount)
            }
        })
    }
    
    private static func parseHeadcount(from data: [String: Any] ) -> Int {
        let countString = data["headcount"] as! String
        let count = Int(countString)
        
        return count!
    }
    
}





