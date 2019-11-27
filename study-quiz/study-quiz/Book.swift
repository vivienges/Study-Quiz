import UIKit


class Book {
    var title: String?
    var publisher: String
    var releaseYear: String
    var coverImage: String?
    var summary: String
    var description: String?
    //var author: String?
    
    
    init(title: String, publisher: String, releaseYear: String, coverImage: String, summary: String, description: String) {
        self.title = title;
        self.publisher = publisher;
        self.releaseYear = releaseYear
        self.summary = summary
        self.description = description
        self.coverImage = coverImage
    }
    
    init() {
        self.publisher = "Empty";
        self.title = "Empty";
        self.releaseYear = "0"
        self.summary = "Empty"
        self.description = "Empty"
        self.coverImage = "Empty"
        
    }
    
    
    
    
    
}
