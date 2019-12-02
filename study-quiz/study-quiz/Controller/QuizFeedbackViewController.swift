//
//  QuizFeedbackViewController.swift
//  study-quiz
//
//  Created by Nikolai Christian Lehbrink on 2019-11-30.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class QuizFeedbackViewController: UIViewController {
    

    @IBOutlet weak var quizFeedbackLabel: UILabel!
    
    var amountCorrectAnswers = 0
    var amountOfQuestions = 0
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        quizFeedbackLabel.text = String(amountCorrectAnswers) + "/" + String(amountOfQuestions) + " answers correct"
            }

}
