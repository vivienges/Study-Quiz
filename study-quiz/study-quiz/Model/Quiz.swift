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

struct Quiz : Codable {
    
    var questions : [Question]?
    var answers : [[String]]?
    
    init(questions: [Question], answers: [[String]]) {
        self.questions = questions
        self.answers = answers
    }
   
    
}
