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

class Quiz: Codable {
    
    //MARK: Properties
    var questions : [Question]
    var answers : [[String]]
    
    
    //MARK: Initializer
    init(questions: [Question], answers: [[String]]) {
        self.questions = questions
        self.answers = answers
    }
    
    init() {
        self.questions = [Question()]
        self.answers = [["answer A","answer B","answer C","answer D"]]
    }
}
