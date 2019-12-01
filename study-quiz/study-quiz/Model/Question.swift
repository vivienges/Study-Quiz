//
//  Question.swift
//  study-quiz
//
//  Created by David Bielenberg on 20.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit


struct Question : Codable {
    
    var questionTitle : String
    var answeredRight : Bool
        
    init(questionTitle: String, answeredRight : Bool) {
            self.questionTitle = questionTitle
        self.answeredRight = answeredRight
        }
    
    init() {
        self.questionTitle = "sample question"
        self.answeredRight = false
    }
    }

