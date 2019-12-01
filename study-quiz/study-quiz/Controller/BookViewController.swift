//
//  BookViewController.swift
//  study-quiz
//
//  Created by David Bielenberg on 15.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit



class BookViewController: UIViewController {
    
    
    // UI Elements
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var bookDescription: UILabel!
    @IBOutlet weak var bookReleaseYear: UILabel!
    @IBOutlet weak var startQuizBtn: UIButton!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    var currentBook = Book()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set data to book information
        navigationBar.title = currentBook.bookTitle
        bookDescription.text = currentBook.description
        
        
        // Set the release year
        let releaseYear = "Release year: " + currentBook.getYear()
        bookReleaseYear.text = releaseYear
        
        //Cover Image
        fetchCoverImage()
    }
    
    @IBAction func pressQuizBtn(_ sender: Any) {
        performSegue(withIdentifier: "startQuiz", sender: self)
    }
    
    
    func fetchCoverImage() {
        let urlKey = "http://books.google.com/books/content?id=YnteDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"
        if let url = URL(string: currentBook.coverImage ?? urlKey){
            do {
                let data = try Data(contentsOf: url)
                coverImage.image = UIImage(data: data)
                
            }catch let err {
                print("Error wegen Thumbnail: \(err.localizedDescription)")
                coverImage.image = UIImage(systemName: "book.fill")
            }
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? QuestionViewController {
            destination.currentQuiz = currentBook.quiz[0]
          
            
        }
        
    }
}





