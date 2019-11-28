//
//  questionJSON.swift
//  study-quiz
//
//  Created by Vivien Geschwind on 27.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import Foundation

struct questionJSON : Codable {
    var question : String
    
    init(question: String) {
        self.question = question
    }
}
