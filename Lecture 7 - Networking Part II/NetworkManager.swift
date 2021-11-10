

import Alamofire
import Foundation

class NetworkManager {

    static let endpoint = "https://hw534-course-demo.herokuapp.com"
    static let endpoint_post = "https://hw534-course-demo.herokuapp.com/api/courses/"

    static func getCourses(completion: @escaping (Array<Course>) -> Void) {
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
                
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let courseResponse = try? jsonDecoder.decode(CoursesResponse.self, from: data){
                    let courses = courseResponse.data
                    print("Completion!!!")
                    completion(courses)
                }else {
                    
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
    }

    static func getCourseById() {
    }

    static func addCourse(code: String,name: String,completion: @escaping (Course) -> Void){
        let parameters: [String: String] = ["code": code, "name": name]
        AF.request(endpoint_post, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let courseResponse = try? jsonDecoder.decode(CourseResponse.self, from: data){
                    let course = courseResponse.data
                    completion(course)
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
    }

}
