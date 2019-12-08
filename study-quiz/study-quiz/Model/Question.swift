//
//  Question.swift
//  study-quiz
//
//  Created by David Bielenberg on 20.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit


class Question: Codable {
    
    //MARK: Properties
    var questionTitle : String
    var answeredRight : Bool
    var answered : Bool
    
    //MARK: Initializer 
    init(questionTitle: String, answeredRight : Bool) {
        self.questionTitle = questionTitle
        self.answeredRight = answeredRight
        self.answered = false
        
        }
    
    init() {
        self.questionTitle = "sample question"
        self.answeredRight = false
        self.answered = false
    }
}

