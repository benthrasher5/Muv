//
//  ActionService.Swift
//  Muv
//
//  Created by Ben on 10/14/17.
//  Copyright © 2017 Ben Thrasher. All rights reserved.
//

import Foundation


class ActionService {
    
    static var cache: [String: Action] = [:]
    
    static func getActions(_ ids: [String], then callback: @escaping ([Action]) -> Void) -> Void {
        var actions: [Action] = []
        for id in ids {
            if let cached = cache[id] {
                actions.append(cached)
            } else {
                getAction(id, then: { action in
                    actions.append(action!)
                })
            }
        }
        
        callback(actions)
    }
    
    static func getAction(_ id: String, then callback: @escaping (Action?) -> Void) -> Void {
        if let cached = cache[id] {
            callback(cached)
        } else {
            fetchAndCacheAction(id, then: callback)
        }
    }
    
    private static func fetchAndCacheAction(_ id: String, then callback: @escaping (Action?) -> Void) -> Void {
        APIService.GET(route: "/API/actions/" + id, callback: { error, data in
            if error == nil, data != nil {
                let action = parseActionFromDict(using: data!)
                cache[data!["_id"] as! String] = action
                callback(action)
            }
        })
    }
    
    private static func parseActionFromDict(using dict: [String: Any]) -> Action {
        
        let id = dict["_id"] as! String
        let muvId = dict["muvId"] as! String
        let userId = dict["userId"] as! String
        let datetime = dict["datetime"] as! String
        
        return Action(id: id, userId: userId, muvId: muvId, datetime: datetime)!
    }
}
