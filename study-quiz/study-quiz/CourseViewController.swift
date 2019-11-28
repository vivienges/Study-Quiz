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
    
    let urlKey = "http://books.google.com/books/content?id=YnteDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"
    
    var books: [Book] = [
    ]
    
    var currentCourse = Course(title: "", teacher: "", description: "", totalQuestions: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.delegate = self
        
        // Set UI to course info
        navigationBar.title = currentCourse.title
        courseDescription.text = currentCourse.description
        progressLabel.text = "0 / \(currentCourse.totalQuestions)"
        
        // MARK: ProgressBar
        // TODO: Make use of course info so the info is not hardcoded
        let progress = Progress(totalUnitCount: 10)
        progress.completedUnitCount = 3
        let progressFloat = Float(progress.fractionCompleted)
        progressBar.setProgress(progressFloat, animated: true)

        
        // MARK: FETCH INFO FROM GOOGLE BOOKS API
        
        // API URL
        // get the list of book from google book api
        let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=learnswift")
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
                                var publisher = volumeInfo!["publisher"] as? String;
                                var publishedDate = volumeInfo!["publishedDate"] as? String;
                                var description = volumeInfo!["description"] as? String;
                                
                                // Trimming Characters to correct character set
                                description = description?.trimmingCharacters(in: .whitespacesAndNewlines);
                                subTitle = subTitle?.trimmingCharacters(in: .whitespacesAndNewlines);
                                title = title?.trimmingCharacters(in: .whitespacesAndNewlines);
                                
                                if (volumeInfo != nil && imageLinks != nil) {
                                    var smallThumbnail = imageLinks!["smallThumbnail"] as! String;
                                    //print(volumeInfo)
                                    if (smallThumbnail != nil && title != nil && smallThumbnail != "" && title != "") {
                                        self.books.append(Book(title: title!, publisher: publisher ?? "Publisher Missing", releaseYear: publishedDate ?? "PulishedDate Missing", coverImage: smallThumbnail, summary: "Summary Missing", description: subTitle ?? "Description Missing"))
                                        print(smallThumbnail)
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

    }
    
    // MARK: TABLE VIEW FUNCTIONS
    
    
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
        cell.cellDetail?.text = currentBook.publisher
        
        
        if let url = URL(string: currentBook.coverImage ?? urlKey){
            do {
                let data = try Data(contentsOf: url)
                cell.cellImage?.image = UIImage(data: data)
                
            }catch let err {
                print("Error wegen Thumbnail: \(err.localizedDescription)")
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
            destination.currentBook = books[(myTableView.indexPathForSelectedRow?.row)!]
            
            myTableView.deselectRow(at: myTableView!.indexPathForSelectedRow!, animated: true)
            
        }
        
    }
}
