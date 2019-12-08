//
//  ProfileViewController.swift
//  study-quiz
//
//  Created by David Bielenberg on 18.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: UI Elements
    @IBOutlet weak var profileHeaderContainer: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var correctAnswersLabel: UILabel!
    @IBOutlet weak var totalAnswersLabel: UILabel!
    @IBOutlet weak var correctAnswerContainer: UIView!
    @IBOutlet weak var totalAnswerContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctAnswerContainer.layer.cornerRadius = 8
        totalAnswerContainer.layer.cornerRadius = 8
        
        profileHeaderContainer.layer.cornerRadius = 8
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        var totalCorrectAnswers = 0
        var totalAnswers = 0
        
        for course in AppData.courses {
            totalCorrectAnswers += course.getCorrectAnswers()
            totalAnswers += course.getTotalAnswers()
        }
        
        correctAnswersLabel.text = String(totalCorrectAnswers)
        totalAnswersLabel.text = String(totalAnswers)
        
    }
    
    
    
    
}
