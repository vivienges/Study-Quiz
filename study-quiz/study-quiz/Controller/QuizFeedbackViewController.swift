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

    var countFired: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //MARK: Calculating the percentage
        var pro = Double(amountCorrectAnswers)/Double(amountOfQuestions)
        let percentage = pro * 100
        
        //MARK: Show Feedback depending on percentage/correct answers
               if (percentage <= 50){
                   feedbackDescLabel.text = "Try it again!"
               } else {
                   feedbackDescLabel.text = "Good job!"
               }
        
               quizCorrectAnswerLabel.text = "\(amountCorrectAnswers)/\(amountOfQuestions)"
           
          //MARK: Progress Circle
        
    
          Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (timer) in
            self.countFired += 1
            
            DispatchQueue.main.async {
               self.progressCircle.progress = min(0.03 * self.countFired, CGFloat(pro))
              
               if self.progressCircle.progress == CGFloat(pro) {
                timer.invalidate()
            }
          }
        }
      }
}
