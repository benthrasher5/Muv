//
//  APIService.swift
//  Muv
//
//  Created by Ben on 10/6/17.
//  Copyright © 2017 Ben Thrasher. All rights reserved.
//

import Foundation

class APIService {
    
    //MARK: Properties
    static var endpointURL = "http://ec2-52-201-26-122.compute-1.amazonaws.com:3000"
    
    //MARK: Public functions
    //TODO: make body more like a json type, not just string to string. Must conform to encodable
    static func POST(route:String, body:[String: String], callback:@escaping (String?, [String: Any]?) -> Void) {
        
        guard let requestBodyJSON = try? JSONEncoder().encode(body) else {
            return
        }
        
        let url:URL = URL(string: endpointURL + route)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: requestBodyJSON) { data, response, error in
            if error != nil {
                DispatchQueue.main.async {
                    callback("transport error", nil)
                }
            }
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200, data != nil {
                    let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                    if let dict = json as? [String: Any] {
                        DispatchQueue.main.async {
                            callback(nil, dict)
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        callback("404 error", nil)
                    }
                }
            }
        }
        task.resume()
    }
    
    static func GET(route:String, callback:@escaping (String?, [String: Any]?) -> Void?) {
        let url:URL = URL(string: endpointURL + route)!
        
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                callback("transport error", nil)
            }
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200, data != nil {
                    let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                    if let dict = json as? [String: Any] {
                        callback(nil, dict)
                    }
                } else {
                    callback("404 error", nil)
                }
            }
        }
        task.resume()
    }
}
