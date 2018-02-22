//
//  AuthService.swift
//  Muv
//
//  Created by Ben on 10/6/17.
//  Copyright © 2017 Ben Thrasher. All rights reserved.
//

import Foundation
import UIKit

class AuthService {
    
    //MARK: Public functions
    static func checkSessionAndLogin(with session:String, callback: @escaping () -> Void) {
        let dict = ["session" : session]
        
        APIService.POST(route: "/session", body: dict, callback: {error, data in
            if error == nil, data != nil {
                callback()
            } else {
                UserDefaults.standard.set(nil, forKey: "session")
                UserDefaults.standard.set(nil, forKey: "userId")
            }
        })
    }
    
    static func login(username:String, password:String, callback: @escaping () -> Void) {
        
        let dict = ["username" : username, "password" : password]
        APIService.POST(route: "/login", body: dict, callback: { error, data in
            if let e = error {
                //TODO: handle bad username vs bad pass
                return
            }
            if let dict = data as? [String: Any] {
                if let session = dict["session"] as? String, let userId = dict["userId"] as? String {
                    UserDefaults.standard.set(session, forKey: "session")
                    UserDefaults.standard.set(userId, forKey: "userId")
                }
                callback()
                return
            }
        })
    }
    
    static func logout(then callback: @escaping () -> Void) {
        if let sessionString = UserDefaults.standard.object(forKey: "session") as? String {
            let dict = ["session" : sessionString]
            
            APIService.POST(route: "/logout", body: dict, callback: { error, data in
                if error == nil {
                    //response good, clear session from memory
                    UserDefaults.standard.set(nil, forKey: "session")
                    
                    callback()
                }
            })
        }
    }
}
