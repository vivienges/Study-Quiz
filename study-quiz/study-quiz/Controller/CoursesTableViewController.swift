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
}

class CoursesTableViewController: UITableViewController {
    
    //MARK: UI Elements
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.separatorStyle = .none
        self.navigationController?.setTransparentNavBar()
 
    }
    
    // MARK: TableView Functions
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
            as! myTableViewCell
    
        let currentCourse = AppData.courses[indexPath.row]
        
        cell.cellTitle?.text = currentCourse.courseTitle
        cell.cellDetail?.text = currentCourse.teacher
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "showCourseSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? CourseViewController {
            destination.currentCourse = AppData.courses[(tableView.indexPathForSelectedRow?.row)!]
            tableView.deselectRow(at: tableView!.indexPathForSelectedRow!, animated: true)
        }
    }
}
