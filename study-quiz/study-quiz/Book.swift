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
    
    var summary: String
    var description: String
    
    init(title: String, author: String, releaseYear: Int, coverImageName: String, summary: String, description: String) {
        self.title = title
        self.author = author
        self.releaseYear = releaseYear
        self.coverImageName = coverImageName
        self.summary = summary
        self.description = description
    }
    
    init() {
        self.title = "niggu"
        self.author = "niggu"
        self.releaseYear = 12
        self.coverImageName = "niggu"
        self.summary = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."

        Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet,
        self.description = "Everything is getting more complex. It is easy to be overwhelmed by the amount of information we encounter each day. Whether at work, at school, or in our personal endeavors, there’s a deepening (and inescapable) need for people to work with and understand information."
    }
    
    func getImage() -> UIImage! {
        return UIImage(named: coverImageName)
    }
    
}
