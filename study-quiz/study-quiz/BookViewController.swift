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
    
    // Buttons
    @IBOutlet weak var summaryBtn: UIButton!
    @IBOutlet weak var startQuizBtn: UIButton!
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sampleBook: Book = Book()
        
        // Set data to book information
        navigationBar.title = sampleBook.title
        bookDescription.text = sampleBook.description

    }
    



}
