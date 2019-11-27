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
    @IBOutlet weak var summaryBtn: UIButton!
    @IBOutlet weak var startQuizBtn: UIButton!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    var currentBook: Book = Book()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set data to book information
        navigationBar.title = currentBook.title
        bookDescription.text = currentBook.description
        bookReleaseYear.text = "\(currentBook.releaseYear)"
    }
}





