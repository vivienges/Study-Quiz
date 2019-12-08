//
//  Quiz.swift
//  study-quiz
//
//  Created by David Bielenberg on 20.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

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
