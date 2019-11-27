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
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //cellImage.layer.cornerRadius = 8
        containerView.layer.cornerRadius = 12
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

struct Course: Codable {
    var title: String
    var teacher: String
    var description: String
    var totalQuestions: Int
}


class CoursesTableViewController: UITableViewController {
    
    
    var courses: [Course] = []
    
    
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let decoder = JSONDecoder()
        
        do {
            let course = try decoder.decode([Course].self, from: jsonData)
            
            for index in 0...(course.count-1) {
                courses.append(Course.init(title: course[index].title, teacher: course[index].teacher, description: course[index].description, totalQuestions: course[index].totalQuestions))
             
            }
           
            
        } catch {
            print(error.localizedDescription)
        }
        
        myTableView.delegate = self
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
            as! myTableViewCell
        
        let currentCourse: Course = courses[indexPath.row]
        
        
        
        cell.cellTitle?.text = currentCourse.title
        cell.cellDetail?.text = "0 / \(currentCourse.totalQuestions)"
       // cell.cellImage?.image = currentCourse.getCoverImage()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "showCourseSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? CourseViewController {
            destination.currentCourse = courses[(tableView.indexPathForSelectedRow?.row)!]
            
            tableView.deselectRow(at: tableView!.indexPathForSelectedRow!, animated: true)
            
            
        }
        
        
    }
    
    
}
