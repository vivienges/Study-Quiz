//
//  quizJSON.swift
//  study-quiz
//
//  Created by Vivien Geschwind on 27.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import Foundation

struct quizJSON : Codable {
    var questions : [questionJSON]
    var answers : [answerJSON]
    
    init(questions: [questionJSON], answers: [answerJSON]) {
        self.questions = questions
        self.answers = answers
    }
}
