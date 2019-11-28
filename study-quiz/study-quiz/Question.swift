//
//  Question.swift
//  study-quiz
//
//  Created by David Bielenberg on 20.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit


struct Question : Codable {
    
    var title : String
    var answeredRight : Bool
        
    init(title: String, answeredRight : Bool) {
            self.title = title
        self.answeredRight = answeredRight
        }
    }

