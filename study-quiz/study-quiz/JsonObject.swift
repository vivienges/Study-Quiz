//
//  JsonObject.swift
//  study-quiz
//
//  Created by Vivien Geschwind on 27.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import Foundation

let jsonString = """
[
    {
        "title": "iOS Development",
        "teacher": "Mikael Bergman",
        "description": "Käsekuchen",
        "totalQuestions": 20
    },
    {
        "title": "Android Development",
        "teacher": "Mikael Bergman",
        "description": "Käsekuchen",
        "totalQuestions": 25,
        "
    }
]
"""

let jsonData = Data(jsonString.utf8)

//class JsonObject {
//    static func downloadCourseObject(completion:((_ json: Data?) -> Void)) {
//        completion(Data(CourseObject.utf8))
//}



