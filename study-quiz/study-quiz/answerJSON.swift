//
//  answerJSON.swift
//  study-quiz
//
//  Created by Vivien Geschwind on 27.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import Foundation

struct answerJSON : Codable {
    var answer : String
    
    init(answer: String) {
        self.answer = answer
    }
}
