//
//  CourseViewController.swift
//  study-quiz
//
//  Created by David Bielenberg on 15.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class bookTableViewCell : UITableViewCell {
    
    // MARK: Cell UI Elements
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDetail: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 12
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

class CourseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: UI Elements
    @IBOutlet weak var courseDescription: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var courseTeacher: UILabel!
    @IBOutlet weak var teacherLabelContainer: UIView!
    
    //MARK: Reference for the course that is handed over from CourseTableViewController
    var currentCourse = Course()
    var courseID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.separatorStyle = .none
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.delegate = self
        
        //MARK: Set UI to course info
        courseTitle.text = currentCourse.courseTitle
        courseTeacher.text = currentCourse.teacher
        courseDescription.text = currentCourse.description
        
        teacherLabelContainer.layer.cornerRadius = teacherLabelContainer.frame.height / 2
        
        
        //MARK: Set Back button to current course
        navigationItem.backBarButtonItem = UIBarButtonItem(title: currentCourse.courseTitle, style: .plain, target: nil, action: nil)

        // MARK: ProgressBar
        // TODO: Make use of course info so the info is not hardcoded
        
//        let progress = Progress(totalUnitCount: 10)
//        progress.completedUnitCount = 3
//        let progressFloat = Float(progress.fractionCompleted)
//        progressBar.setProgress(progressFloat, animated: true)
        
        // MARK: Fetch book infos from Google API by isbn
        var index = 0
        for book in currentCourse.books {
            if book.isbn != nil && book.isbn != "" {
                let isbn = book.isbn!
                addBookInfo(isbn: isbn, index: index)
            }
            index = index + 1
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    func addBookInfo(isbn: String, index: Int) {
        
        let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=isbn:" + isbn)
        
        URLSession.shared.dataTask(with: ((url)! as URL), completionHandler: {(data, response, error) -> Void in
            if (error != nil) {
                print(error?.localizedDescription ?? "dataTask failed")
            } else {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                    if let actorArray = jsonObj.value(forKey: "items") as? NSArray {
                        for actor in actorArray{
                            if let actorDict = actor as? NSDictionary {
                                
                                // References to data from the API
                                let volumeInfo = actorDict["volumeInfo"] as? [String: AnyObject]
                                let imageLinks = volumeInfo!["imageLinks"] as? [String: AnyObject]
                                let title = volumeInfo!["title"] as? String
                                let subTitle = volumeInfo!["subtitle"] as? String
                                let authors = volumeInfo!["authors"] as? [String]
                                let publishedDate = volumeInfo!["publishedDate"] as? String;
                                
                                if (volumeInfo != nil && imageLinks != nil) {
                                    let smallThumbnail = imageLinks!["thumbnail"] as! String;
                                    if (smallThumbnail != "" && title != "") {
                                        // Write data from API into the books of our Class
                                        self.currentCourse.books[index].coverImage! = smallThumbnail
                                        self.currentCourse.books[index].description! = subTitle ?? ""
                                        self.currentCourse.books[index].bookTitle! = title ?? self.currentCourse.books[index].bookTitle!
                                        if authors != nil && authors != [""]  && publishedDate != nil && publishedDate != "" {
                                            //print("Release Year from API: \(publishedDate!)")
                                            self.currentCourse.books[index].authors = authors!
                                            self.currentCourse.books[index].releaseYear = publishedDate!
                                        }
                                        
                                    }
                                }
                            }
                        }
                    }
                    OperationQueue.main.addOperation({
                        self.myTableView.reloadData()
                    })
                }
            }
        }).resume()
        reloadInputViews();
    }
    
   
    
    // MARK: TableView Functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentCourse.books.count
    }   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
            as! bookTableViewCell
        
        let currentBook: Book = currentCourse.books[indexPath.row]
        cell.cellTitle?.text = currentBook.bookTitle
        
        var authors = currentBook.authors[0]
        
        cell.cellDetail?.text = authors
        
        if let url = URL(string: currentBook.coverImage ?? ""){
            do {
                let data = try Data(contentsOf: url)
                cell.cellImage?.image = UIImage(data: data)
            }catch let err {
                print("Thumbnail Error: \(err.localizedDescription)") //english?
//                cell.cellImage.image = UIImage(systemName: "book.fill")
            }
        }
        return cell
    }
    
    
    // MARK: Setup segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showBookSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BookViewController {
            destination.currentBook = currentCourse.books[(myTableView.indexPathForSelectedRow?.row)!]
           // destination.authors = authors
            myTableView.deselectRow(at: myTableView!.indexPathForSelectedRow!, animated: true)
        }
    }
}
