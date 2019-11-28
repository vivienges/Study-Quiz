//
//  bookJSON.swift
//  study-quiz
//
//  Created by Vivien Geschwind on 27.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import Foundation

struct bookJSON : Codable {
    
    var isbn : String
    var quiz : [quizJSON]
    
    init(isbn : String, quiz : [quizJSON]) {
    
    self.isbn = isbn
    self.quiz = quiz
    
}
}




