//
//  Book.swift
//  study-quiz
//
//  Created by David Bielenberg on 15.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class Book {
    var title: String
    var author: String
    var releaseYear: Int
    var coverImageName: String
    
    init(title: String, author: String, releaseYear: Int, coverImageName: String) {
        self.title = title
        self.author = author
        self.releaseYear = releaseYear
        self.coverImageName = coverImageName
    }
    
    func getImage() -> UIImage! {
        return UIImage(named: coverImageName)
    }
    
}
