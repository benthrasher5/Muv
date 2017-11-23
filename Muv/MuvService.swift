import Foundation
import UIKit

class MuvService {
    
    //MARK: properties
    static var cache: [String:Muv]?
    
    static func getSampleMuvs() -> [Muv] {
        var a: [Muv] = []
        a.append(Muv(id: "abc", name: "SwiftSample1", description: "This is the first ", specialText: "idk", imageFolderURL: "yea", location: "idk either"))
        
        return a
    }
    
    static func getMuvs(_ ids: [String], then callback: @escaping ([Muv]) -> Void) -> Void {
        var muvs: [Muv] = []
        for id in ids {
            if let cached = cache![id] {
                muvs.append(cached)
            } else {
                getMuv(id, then: { muv in
                    muvs.append(muv!)
                })
            }
        }
        
        callback(muvs)
    }
    
    
    static func getMuv(_ id: String, then callback: @escaping (Muv?) -> Void) -> Void {
        if let cached = cache![id] {
            callback(cached)
        } else {
            fetchAndCacheMuv(id, then: callback)
        }
    }
    
    
    private static func fetchAndCacheMuv(_ id: String, then callback: @escaping (Muv?) -> Void) -> Void {
        APIService.GET(route: "/API/muvs/" + id, callback: { error, data in
            if error == nil, data != nil {
                let muv = parseMuvFromDict(using: data!)
                cache![data!["_id"] as! String] = muv
                callback(muv)
            }
        })
    }
    
    private static func parseMuvFromDict(using dict: [String: Any]) -> Muv {
        
        let id = dict["_id"] as! String
        let name: String! = dict["name"] as! String
        let description: String! = dict["description"] as! String
        let specialText: String! = dict["specialText"] as! String
        let imageFolderURL: String! = dict["imageFolderURL"] as! String
        let location: String! = dict["location"] as! String
        
        
        return Muv(id: id, name: name, description: description, specialText: specialText, imageFolderURL: imageFolderURL, location: location)
    }
    
    
}

