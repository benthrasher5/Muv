import Foundation
import UIKit

class UserService {
    //MARK: Properties
    static var cache: User? = nil
    
    static func getUser() -> User? {
        if let cached = cache {
            return cached
        } else {
            return fetchUser()
        }
    }
    
    private static func fetchUser() -> User? {
        return nil
        
        //Get session to get UserId, then get User, cache it and return
    }
}
