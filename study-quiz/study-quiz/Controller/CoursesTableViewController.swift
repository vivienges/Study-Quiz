//
//  CoursesTableViewController.swift
//  study-quiz
//
//  Created by David Bielenberg on 16.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {
    
    //MARK: UI Elements
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDetail: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 12
        cellTitle.font = .boldSystemFont(ofSize: 18)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

class CoursesTableViewController: UITableViewController {
    
    //MARK: UI Elements
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.separatorStyle = .none
        self.navigationController?.setTransparentNavBar()
        
        print("PROGRESS: \(AppData.courses[0].books[0].quiz.questions[0].answeredRight)")
        
        if AppData.courses[0].books[0].quiz.questions[0].answeredRight == true {
            print("PROGRESS HAS BEEN MADE!")
        }
        
        
    }
    
    // MARK: - TableView Functions
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
            as! myTableViewCell
        
        // Load in data from JSON-File
        AppData.loadJSON()
        let currentCourse = AppData.courses[indexPath.row]
        
        AppData.courses[0].books[0].bookTitle = "I HAVE CHANGED!"
        print(AppData.courses[0].books[0].bookTitle)
        
        cell.cellTitle?.text = currentCourse.courseTitle
        cell.cellDetail?.text = currentCourse.teacher
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "showCourseSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? CourseViewController {
            //destination.currentCourse = courses[(tableView.indexPathForSelectedRow?.row)!]
            destination.courseID = (tableView.indexPathForSelectedRow?.row)!
            
            tableView.deselectRow(at: tableView!.indexPathForSelectedRow!, animated: true)
            
            
        }
        
        
    }
    
    
}
