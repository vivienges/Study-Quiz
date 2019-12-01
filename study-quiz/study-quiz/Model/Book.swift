import UIKit


struct Book : Codable {
    var isbn : String?
    var bookTitle: String?
    var publisher: String?
    var releaseYear: String?
    var coverImage: String?
    var summary: String?
    var description: String?
    var quiz : [Quiz]

    

    
    
    init(isbn : String, bookTitle: String, publisher: String, releaseYear: String, coverImage: String, summary: String, description: String, quiz : [Quiz]) {
        self.isbn = isbn
        self.bookTitle = bookTitle;
        self.publisher = publisher;
        self.releaseYear = releaseYear
        self.summary = summary
        self.description = description
        self.coverImage = coverImage
        self.quiz = quiz
    }
    
    init() {
        self.isbn = "0"
        self.publisher = "Empty";
        self.bookTitle = "Empty";
        self.releaseYear = "0"
        self.summary = "Empty"
        self.description = "Empty"
        self.coverImage = "Empty"
        self.quiz = [Quiz()]
    }
    
    func getDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: "2015-04-01") // replace Date String
        
    }
    
    
    func getYear() -> String {
        
        let date = self.getDate()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        
        let now = dateFormatter.string(from: Date())
        
        return now
        
    }
    
    
    
    
    
    
}
