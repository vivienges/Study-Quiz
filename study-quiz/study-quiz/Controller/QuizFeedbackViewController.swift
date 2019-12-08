//
//  QuizFeedbackViewController.swift
//  study-quiz
//
//  Created by Nikolai Christian Lehbrink on 2019-11-30.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class QuizFeedbackViewController: UIViewController {
    
    //MARK: UI Elements
    @IBAction func retakeQuizButton(_ sender: UIButton) {}
    @IBOutlet weak var quizCorrectAnswerLabel: UILabel!
    @IBOutlet weak var feedbackDescLabel: UILabel!
    @IBOutlet weak var progressCircle: ProgressCircle!
    
    //MARK: Properties
    var amountCorrectAnswers = 0
    var amountOfQuestions = 0
    
    override func viewDidLoad() {
        
        //MARK: Calculating the percentage of correct answers
        let percentage = Float(amountCorrectAnswers)/Float(amountOfQuestions)
        
        //MARK: Show Feedback depending on the percentage of correct answers
        if (percentage <= 0.5){
            feedbackDescLabel.text = "Try it again!"
        } else {
            feedbackDescLabel.text = "Good job!"
        }
        quizCorrectAnswerLabel.text = "\(amountCorrectAnswers)/\(amountOfQuestions)"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        //MARK: Calculating the percentage of correct answers
        let percentage = Float(amountCorrectAnswers)/Float(amountOfQuestions)
        progressCircle.setProgressWithAnimation(value: percentage)
    }
}
