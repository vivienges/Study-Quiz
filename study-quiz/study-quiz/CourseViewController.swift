//
//  CourseViewController.swift
//  study-quiz
//
//  Created by David Bielenberg on 17.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class bookTableViewCell : UITableViewCell {
    
    // Cell UI Elements
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDetail: UILabel!
   @IBOutlet weak var cellImage: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}



class CourseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    
    @IBOutlet weak var courseDescription: UILabel!
    
    
    
    
    
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    // Book Table View
    @IBOutlet weak var myTableView: UITableView!
    
    var books: [Book] = [
        Book(),
        Book(),
        Book()
    ]
    
    var currentCourse = Course(title: "", teacher: "", description: "", totalQuestions: 0, books: [bookJSON(isbn: "", quiz: [quizJSON(questions: [questionJSON(question: "")], answers: [answerJSON(answer: "")])])])
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.delegate = self
        
        
        navigationBar.title = currentCourse.title
        courseDescription.text = currentCourse.description
        
    }
    
    
    
    
    
    
    
    // TABLE VIEW FUNCTIONS
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return books.count
    }   
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
            as! bookTableViewCell
        
        let currentBook: Book = books[indexPath.row]
        
        cell.cellTitle?.text = currentBook.title
        cell.cellDetail?.text = currentBook.author
        cell.cellImage.image = currentBook.getImage()

        
        
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "showBookSegue", sender: self)
        
    }
}
