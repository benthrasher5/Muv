import Foundation
import UIKit

class MuvService {
    
    //MARK: properties
    static var cache: [String:Muv] = [:]
    
    static func getSampleMuvs() -> [Muv] {
        var a: [Muv] = []
        a.append(Muv(id: "59dee37c7a0357c05dd5f39c", name: "SwiftSample1", description: "This is the first ", specialText: "idk", imageFolderURL: "yea", location: "idk either"))
        
        return a
    }
    
    static func getMuvs(_ ids: [String], then callback: @escaping ([Muv]) -> Void) -> Void {
        var muvs: [Muv] = []
        var notCachedIds: [String] = []
        for id in ids {
            if let cached = cache[id] {
                muvs.append(cached)
            } else {
                notCachedIds.append(id)
            }
        }
        
        if(notCachedIds.count == 0) {
            callback(muvs)
        } else {
            fetchAndCacheMuvs(notCachedIds, then: { (fetched) in
                if let got = fetched {
                    muvs += got
                }
                callback(muvs)
            })
        }
    }
    
    
    static func getMuv(_ id: String, then callback: @escaping (Muv?) -> Void) -> Void {
        if let cached = cache[id] {
            callback(cached)
        } else {
            fetchAndCacheMuv(id, then: callback)
        }
    }
    
    private static func fetchAndCacheMuvs(_ ids: [String], then callback: @escaping ([Muv]?) -> Void) -> Void {
        let requestBody = ["ids": ids]
        APIService.POST(route: "/API/muvs/multiple", body: requestBody, callback: { error, data in
            if error == nil, let array = data as? [Any] {
                let muvs = parseMuvsFromArray(using: array)
                for muv in muvs {
                    cache[muv.id] = muv
                }
                callback(muvs)
            }
        })
    }
    
    
    private static func fetchAndCacheMuv(_ id: String, then callback: @escaping (Muv?) -> Void) -> Void {
        APIService.GET(route: "/API/muvs/" + id, callback: { error, data in
            if error == nil, data != nil {
                let muv = parseMuvFromDict(using: data!)
                cache[data!["_id"] as! String] = muv
                callback(muv)
            }
        })
    }
    
    private static func parseMuvsFromArray(using array: [Any]) -> [Muv] {
        var muvs: [Muv] = []
        for muv in array {
            if let muvAsDict = muv as? [String: Any] {
                muvs.append(parseMuvFromDict(using: muvAsDict))
            }
        }
        
        return muvs
    }
    
    private static func parseMuvFromDict(using dict: [String: Any]) -> Muv {
        
        //var id: String, name: String, description: String, specialText: String, imageFolderURL: String, location: String
        
        let id = dict["_id"] as! String
        let name: String! = dict["name"] as! String
        let description: String! = dict["description"] as! String
        let specialText: String? = dict["specialText"] as? String
        let imageFolderURL: String! = dict["imageFolderURL"] as! String
        let location: String! = dict["location"] as! String
        
        
        return Muv(id: id, name: name, description: description, specialText: specialText, imageFolderURL: imageFolderURL, location: location)
    }
    
    
}

