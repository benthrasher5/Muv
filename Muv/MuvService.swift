import Foundation
import UIKit

class MuvService {
    
    //MARK: properties
    var cache: [Muv] = []
    
    
    //MARK: public functions
    static func getMuvs() -> [Muv] {
        let muvs = getSampleMuvs()
        return muvs
    }
    
    //MARK: private functions
    private static func fetchMuvs() -> [Muv] {
        return getSampleMuvs()
    }
    
    private static func getSampleMuvs() -> [Muv] {
        guard let muv1 = Muv(name: "Harpos") else {
            fatalError("Unable to load sample muv 1")
        }
        muv1.peopleCount = 27
        muv1.dealsText = "$1 Shots, $2 Bottles, $3 Wells"
        muv1.photo = UIImage(named: "HarposLogo")
        
        
        guard let muv2 = Muv(name: "My House") else {
            fatalError("Unable to load sample muv 2")
        }
        muv2.peopleCount = 13
        muv2.dealsText = "$5 Triple-Wells, $2 Shots"
        muv2.photo = UIImage(named: "MyHouseLogo")
        
        guard let muv3 = Muv(name: "Field House") else {
            fatalError("Unable to load sample muv 3")
        }
        muv3.peopleCount = 9
        muv3.dealsText = "Penny Pitchers"
        muv3.photo = UIImage(named: "FieldHouseLogo")
        
        return [muv1, muv2, muv3]
    }
}
