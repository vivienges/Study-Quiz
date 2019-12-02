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
    
    
    
    var currentCourse = Course()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.delegate = self
        
        // Set UI to course info
        navigationBar.title = currentCourse.courseTitle
        courseDescription.text = currentCourse.description
        
        
        // MARK: ProgressBar
        // TODO: Make use of course info so the info is not hardcoded
        
        let progress = Progress(totalUnitCount: 10)
        progress.completedUnitCount = 3
        let progressFloat = Float(progress.fractionCompleted)
        progressBar.setProgress(progressFloat, animated: true)
        
        // MARK: FETCH INFO FROM GOOGLE BOOKS API
        var index = 0
        for book in currentCourse.books {
            if book.isbn != nil && book.isbn != "" {
                let isbn = book.isbn!
                addBookInfo(isbn: isbn, index: index)
                print("PLEASE: \(book.coverImage!)")
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
                print(error?.localizedDescription)
            } else {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                    if let actorArray = jsonObj.value(forKey: "items") as? NSArray {
                        for actor in actorArray{
                            if let actorDict = actor as? NSDictionary {
                                
                                // saving the data we need for the user interface
                                let volumeInfo = actorDict["volumeInfo"] as? [String: AnyObject]
                                let imageLinks = volumeInfo!["imageLinks"] as? [String: AnyObject]
                                var title = volumeInfo!["title"] as? String;
                                
                                var subTitle = volumeInfo!["subtitle"] as? String;
                                let publisher = volumeInfo!["publisher"] as? String;
                                let publishedDate = volumeInfo!["publishedDate"] as? String;
                                var description = volumeInfo!["description"] as? String;
                                
                                
                                if (volumeInfo != nil && imageLinks != nil) {
                                    let smallThumbnail = imageLinks!["smallThumbnail"] as! String;
                                    if (smallThumbnail != nil && title != nil && smallThumbnail != "" && title != "") {
                                        // Write data from API into the books of our Class
                                        self.currentCourse.books[index].coverImage! = smallThumbnail
                                        self.currentCourse.books[index].description! = subTitle ?? ""
                                        self.currentCourse.books[index].bookTitle! = title ?? self.currentCourse.books[index].bookTitle!
                                        if publisher != nil && publisher != ""  && publishedDate != nil && publishedDate != "" {
                                            //print("Release Year from API: \(publishedDate!)")
                                            self.currentCourse.books[index].publisher = publisher
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
    
    
    // MARK: TABLE VIEW FUNCTIONS
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentCourse.books.count
    }   
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
            as! bookTableViewCell
        
        //let currentBook: Book = books[indexPath.row]
        let currentBook: Book = currentCourse.books[indexPath.row]
        cell.cellTitle?.text = currentBook.bookTitle
        cell.cellDetail?.text = currentBook.publisher
        
        // TODO: Move the image fetching to the Book class in its own function
        
        let urlKey = "http://books.google.com/books/content?id=YnteDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"
        
        
        if let url = URL(string: currentBook.coverImage ?? urlKey){
            do {
                let data = try Data(contentsOf: url)
                cell.cellImage?.image = UIImage(data: data)
            }catch let err {
                print("Thumbnail Error: \(err.localizedDescription)") //english?
                cell.cellImage.image = UIImage(systemName: "book.fill")
            }
        }
        
        
        
        return cell
        
    }
    
    
    // MARK: SETUP SEGUEWAYS
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        self.performSegue(withIdentifier: "showBookSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? BookViewController {
            
            //print("Current Book Quiz: \(currentBook.quiz)")
            destination.currentBook = currentCourse.books[(myTableView.indexPathForSelectedRow?.row)!]
            
            myTableView.deselectRow(at: myTableView!.indexPathForSelectedRow!, animated: true)
            
        }
        
    }
}
