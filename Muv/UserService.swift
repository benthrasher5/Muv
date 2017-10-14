import Foundation
import UIKit

class UserService {
    //MARK: Properties
    static var cache: [String: User] = [:]
    
    static func getAppUser(then callback: @escaping (User?) -> Void) -> Void {
        let appUserId = UserDefaults.standard.string(forKey: "userId")!
        getUser(appUserId, then: callback)
    }
    
    static func getUsers(_ ids: [String], then callback: @escaping ([User]) -> Void) -> Void {
        var users: [User] = []
        for id in ids {
            if let cached = cache[id] {
                users.append(cached)
            } else {
                getUser(id, then: { user in
                    users.append(user!)
                })
            }
        }
        
        callback(users)
    }
    
    static func getUser(_ id: String, then callback: @escaping (User?) -> Void) -> Void {
        if let cached = cache[id] {
            callback(cached)
        } else {
            fetchAndCacheUser(id, then: callback)
        }
    }
    
    private static func fetchAndCacheUser(_ id: String, then callback: @escaping (User?) -> Void) -> Void {
        APIService.GET(route: "/API/users/" + id, callback: { error, data in
            if error == nil, data != nil {
                let user = parseUserFromDict(using: data!)
                cache[data!["_id"] as! String] = user
                callback(user)
            }
        })
    }
    
    private static func parseUserFromDict(using dict: [String: Any]) -> User {
        let nameDict = dict["name"] as! [String : String]
        let firstName: String! = nameDict["first"]
        let lastName: String! = nameDict["last"]
        let username = dict["username"] as! String
        
        return User(username: username, firstName: firstName, lastName: lastName)!
    }
}
