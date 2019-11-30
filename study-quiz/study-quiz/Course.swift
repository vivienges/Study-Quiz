//
//  Course.swift
//  study-quiz
//
//  Created by David Bielenberg on 16.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

struct Course: Codable {

    var courseTitle: String?
    var teacher: String?
    var description: String?
    let totalQuestions: Int?
    var books: [Book]?

    init(courseTitle: String, teacher: String, description: String, totalQuestions: Int, books: [Book]) {
        self.courseTitle = courseTitle
        self.teacher = teacher
        self.description = description
        self.totalQuestions = totalQuestions
        self.books = books
        
        //answeredQuestions = 0

    }
//
//    
//    func setAnsweredQUestions(answeredQuestions: Int) {
//        self.answeredQuestions = answeredQuestions
//    }

}
