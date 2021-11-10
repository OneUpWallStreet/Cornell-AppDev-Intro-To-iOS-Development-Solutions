

import Foundation

struct CoursesResponse: Codable {
    var success: Bool
    var data: Array<Course>
}

struct CourseResponse: Codable {
    var success: Bool
    var data: Course
}

struct Course: Codable {
    var id: Int
    var name: String
    var code: String
    var assignments: [Assignment]
}

struct Assignment: Codable {
    var id: Int
    var title: String
    var dueDate: String
}

