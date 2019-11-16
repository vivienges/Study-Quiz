//
//  Course.swift
//  study-quiz
//
//  Created by David Bielenberg on 16.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class Course {
    
    var title: String
    var teacher: String
    var description: String
    
    var courseTitleImageName: String
    
    init(title: String,teacher: String,description: String,courseTitleImageName: String) {
        self.title = title
        self.teacher = teacher
        self.description = description
        self.courseTitleImageName = courseTitleImageName

    }

    func getCoverImage() -> UIImage! {
        return UIImage(systemName: courseTitleImageName)
    }

    
    
}
