//
//  BookViewController.swift
//  study-quiz
//
//  Created by David Bielenberg on 15.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class BookViewController: UIViewController {
    
    // MARK: UI Elements
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var bookDescription: UILabel!
    @IBOutlet weak var bookReleaseYear: UILabel!
    @IBOutlet weak var startQuizBtn: UIButton!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthors: UILabel!
    @IBOutlet weak var coverImageContainer: UIView!
    @IBOutlet weak var bookReleaseLabelContainer: UIView!
    
    
    //MARK: Reference for the book that is handed over from CourseViewController
    var currentBook = Book()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView?.backgroundColor = .clear
        navigationItem.largeTitleDisplayMode = .never
        
        bookReleaseLabelContainer.layer.cornerRadius = bookReleaseLabelContainer.frame.height / 2

        // MARK: Set data to book information
        bookTitle.text = currentBook.bookTitle
        bookDescription.text = currentBook.description
        
        var authors = ""
        
        for author in currentBook.authors {
            
            if (authors != "") {
                authors = authors + ", " + author!
            } else {
                authors = authors + author!
            }
        }
        
        bookAuthors.text = authors
        
        
        // MARK: Set the release year
        let releaseYear = currentBook.getYear()
        bookReleaseYear.text = releaseYear
        
        //MARK: fetch book cover
        fetchCoverImage()
    
    }
    
    @IBAction func unwindToBookVC(segue:UIStoryboardSegue) {
        
    }
    
    
    func fetchCoverImage() {
        let urlKey = "http://books.google.com/books/content?id=YnteDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"
        if let url = URL(string: currentBook.coverImage ?? urlKey){
            do {
                let data = try Data(contentsOf: url)
                coverImage.image = UIImage(data: data)
                
            }catch let err {
                print("Thumbnail Error: \(err.localizedDescription)")
                coverImage.image = UIImage(systemName: "book.fill")
            }
        }
    }
    
    //MARK: Setup segue
    @IBAction func pressQuizBtn(_ sender: Any) {
        performSegue(withIdentifier: "startQuiz", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? QuestionViewController {
            destination.currentQuiz = currentBook.quiz[0]
        }
    }
}





