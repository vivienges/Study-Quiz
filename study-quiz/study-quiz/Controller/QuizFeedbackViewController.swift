//
//  QuizFeedbackViewController.swift
//  study-quiz
//
//  Created by Nikolai Christian Lehbrink on 2019-11-30.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class QuizFeedbackViewController: UIViewController {
    
    @IBAction func retakeQuizButton(_ sender: UIButton) {
    }
    //MARK: UI Elements
    
    @IBOutlet weak var quizCorrectAnswerLabel: UILabel!
    @IBOutlet weak var feedbackDescLabel: UILabel!
    //MARK: Properties
    var amountCorrectAnswers = 0
    var amountOfQuestions = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let percentage = (amountCorrectAnswers/amountOfQuestions) * 100
        
        if (percentage <= 50){
            feedbackDescLabel.text = "Try it again!"
        } else {
            feedbackDescLabel.text = "Good job!"
        }
 
        quizCorrectAnswerLabel.text = "\(amountCorrectAnswers)/\(amountOfQuestions)"
        }

}
