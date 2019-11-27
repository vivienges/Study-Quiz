import UIKit


class Book {
    var title: String?
    var author: String
    var releaseYear: Int
    var coverImage: String?
    var summary: String
    var description: String?
    
    
    init(title: String, subTitle: String, releaseYear: Int, coverImage: String, summary: String, description: String) {
        self.title = title;
        self.author = subTitle;
        self.releaseYear = releaseYear
        self.summary = summary
        self.description = description
        self.coverImage = coverImage
    }
    
    init() {
        self.author = "Empty";
        self.title = "Empty";
        self.releaseYear = 0
        self.summary = "Empty"
        self.description = "Empty"
        self.coverImage = "Empty"
        
    }
    
    
    
    
    
}
