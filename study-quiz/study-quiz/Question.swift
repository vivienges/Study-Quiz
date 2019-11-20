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
    let answers: [String]
    let totalAnswers: Int
    let correctAnswer: String
    let indexCorrectAnswer: Int
    var answered: Bool
    
    init(question: String, answers: [String], indexCorrectAnswer: Int) {
        self.question =  question
        self.answers = answers
        self.totalAnswers =  answers.count
        self.correctAnswer = answers[indexCorrectAnswer]
        self.indexCorrectAnswer = indexCorrectAnswer
        self.answered =  false
    }
    
    func getFeedback(indexAnswer: Int) -> Bool {
        if indexAnswer == indexCorrectAnswer {
            answered = true
            return true
        }; return false
        
    }
    
}
