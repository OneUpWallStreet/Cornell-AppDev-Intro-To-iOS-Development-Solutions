

import Foundation
import Alamofire


// How do we make network calls?

class NetworkManager {
    
    static let endpoint = "https://mindylou.github.io/classes.json"
    
    static func getCourses() {
        AF.request(endpoint, method: .get).validate().responseJSON { response in
            switch response.result {
                
            case .success(let data):
                print(data)
            case .failure(let error):
                print("Failure, error is \(error)")
            }
        }
    }

}
