//
//  CoursesTableViewController.swift
//  study-quiz
//
//  Created by David Bielenberg on 16.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit


class myTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}


class CoursesTableViewController: UITableViewController {
    
    
    var courses: [Course] = [
    
        Course(title: "Course 1", teacher: "Teacher 1", description: "Lorem Ipsum", courseTitleImageName: "none"),
        Course(title: "Course 2", teacher: "Teacher 2", description: "Lorem Ipsum", courseTitleImageName: "none"),
        Course(title: "Course 3", teacher: "Teacher 3", description: "Lorem Ipsum", courseTitleImageName: "none"),
        Course(title: "Course 4", teacher: "Teacher 4", description: "Lorem Ipsum", courseTitleImageName: "none")
    
    ]
    
    
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        
        // Set height for section headers
        self.tableView.sectionHeaderHeight = 50
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
            as! myTableViewCell
        
        let currentCourse: Course = courses[indexPath.row]
        
        
        
        cell.cellTitle?.text = currentCourse.title
        cell.cellDetail?.text = currentCourse.teacher
        
        return cell
    }
    
    
    
}
