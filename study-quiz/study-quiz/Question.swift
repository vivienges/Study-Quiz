//
//  Question.swift
//  study-quiz
//
//  Created by David Bielenberg on 20.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class Question {
    
    let question: String
    var answers: [String]
    let totalAnswers: Int
    let correctAnswer: String
    let indexCorrectAnswer: Int
    var answered: Bool
    
    init(question: String, answers: [String], indexCorrectAnswer: Int) {
        self.question =  question
        self.answers = answers
        self.totalAnswers =  answers.count
        self.indexCorrectAnswer = indexCorrectAnswer
        self.correctAnswer = answers[indexCorrectAnswer]
        self.answered =  false
    }
    
    init() {
        self.question =  "What does the Cow say?"
        self.answers = [
            "Moo",
            "Wuff",
            "WOOO",
            "Hi"
        ]
        self.totalAnswers =  answers.count
        self.indexCorrectAnswer = 0
        self.correctAnswer = answers[indexCorrectAnswer]
        
        self.answered =  false
    }
    
    func getFeedback(indexAnswer: Int) -> Bool {
        if indexAnswer == indexCorrectAnswer {
            answered = true
            return true
        }; return false
        
    }
    
}
