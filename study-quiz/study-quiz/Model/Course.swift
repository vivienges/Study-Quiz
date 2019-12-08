//
//  Course.swift
//  study-quiz
//
//  Created by David Bielenberg on 16.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class Course: Codable {

    //MARK: Properties
    var courseTitle: String
    let ID: Int
    var teacher: String
    var description: String
    var books: [Book]
    
    
    //MARK: Initializer
    init(courseTitle: String, ID: Int, teacher: String, description: String, books: [Book]) {
        self.ID = ID
        self.courseTitle = courseTitle
        self.teacher = teacher
        self.description = description
        self.books = books
    }
    
    init() {
        self.ID = 5
        self.courseTitle = "Sample"
        self.teacher = "Sample"
        self.description = "Sample"
        self.books = [Book()]
    }
    
    func getCorrectAnswers() -> Int {
        var amountCorrect = 0
        
        for book in self.books {
            for question in book.quiz.questions {
                if question.answeredRight {
                    amountCorrect += 1
                }
            }
        }
        return amountCorrect
    }
    
    func getTotalAnswers() -> Int {
        var totalQuestions = 0
        
        for book in self.books {
            for question in book.quiz.questions {
                if question.answered {
                    totalQuestions += 1
                }
            }
        }
        return totalQuestions
    }
}
