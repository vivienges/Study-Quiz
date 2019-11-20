//
//  Quiz.swift
//  study-quiz
//
//  Created by David Bielenberg on 20.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

// This class organized a Quiz. It mainly consists of multiple Questions that can be answered or not
// Right now this is not able to set the completedQuestions variable automatically

class Quiz {
    
    let name: String
    let questions: [Question]
    
    let totalQuestions: Int
    var completedQuestions: Int
    var isCompleted: Bool
    
    init(name: String, questions: [Question] ,totalQuestions: Int) {
        self.name = name
        self.questions = questions
        self.totalQuestions = totalQuestions
        completedQuestions = 0
        isCompleted = false
    }
    
    func getState() -> String {
        if isCompleted ==  true {
            return "Quiz is completed"
        } else {
            return "\(totalQuestions-completedQuestions) left to answer."
        }
    }

    
    
}
