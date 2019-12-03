import UIKit


struct Book : Codable {
    
    //MARK: Properties
    var isbn : String?
    var bookTitle: String?
    var authors: [String?]
    var releaseYear: String?
    var coverImage: String?
    var summary: String?
    var description: String?
    var quiz : [Quiz]

    
    //MARK: Initializer
    init(isbn : String, bookTitle: String, authors: [String], releaseYear: String, coverImage: String, summary: String, description: String, quiz : [Quiz]) {
        self.isbn = isbn
        self.bookTitle = bookTitle
        self.authors = authors
        self.releaseYear = releaseYear
        self.summary = summary
        self.description = description
        self.coverImage = coverImage
        self.quiz = quiz
    }
    
    init() {
        self.isbn = "0"
        self.authors = ["Empty"]
        self.bookTitle = "Empty"
        self.releaseYear = "0"
        self.summary = "Empty"
        self.description = "Empty"
        self.coverImage = "Empty"
        self.quiz = [Quiz()]
    }

    //MARK: Get release year
    func getYear() -> String {
        return self.releaseYear!
    }
}
