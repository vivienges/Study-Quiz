import UIKit


class Book {
    var title: String
    var author: String
    var releaseYear: Int
    var coverImage: UIImage
    var summary: String
    var description: String
    
    let searchText = "book"
    
    
    init(title: String, author: String, releaseYear: Int, coverImageName: String, summary: String, description: String) {
        self.title = title
        self.author = author
        self.releaseYear = releaseYear
        self.summary = summary
        self.description = description
        self.coverImage = UIImage(systemName: "tray.fill")!
    }
    
    init() {
        self.title = "How to make sense of any mess"
        self.author = "Abby Covert"
        self.releaseYear = 2014
        self.summary = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet."
        self.description = "Everything is getting more complex. It is easy to be overwhelmed by the amount of information we encounter each day. Whether at work, at school, or in our personal endeavors, there’s a deepening (and inescapable) need for people to work with and understand information."
        self.coverImage = UIImage(systemName: "tray.fill")!
    }
    
    func getImage() -> UIImage! {
        
        // For Placeholder Icons:
        return coverImage
    }
    
    
    
    
    
}
