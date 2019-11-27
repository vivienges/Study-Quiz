//
//  FeedbackQuestionViewController.swift
//  study-quiz
//
//  Created by David Bielenberg on 2019-11-21.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class FeedbackQuestionViewController: UIViewController {

    var currentQuiz = Quiz()
    var booleanAnswer = false
    

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerHeadline: UILabel!
    @IBOutlet weak var correctAnswer: UILabel!
    @IBOutlet weak var feedbackIcon: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentQuestion = currentQuiz.questions[0]
        questionLabel.text = currentQuestion.question
        correctAnswer.text = currentQuestion.correctAnswer

        if booleanAnswer == false {
            correctAnswer.textColor = UIColor.red
            self.feedbackIcon.image = UIImage(systemName: "xmark.rectangle.fill")
            self.feedbackIcon.tintColor = UIColor.red
        } else {
            correctAnswer.textColor = UIColor.green
            self.feedbackIcon.image = UIImage(systemName: "checkmark.rectangle.fill")
            self.feedbackIcon.tintColor = UIColor.green
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? QuestionViewController else {
            //Handle the nil value, log, etc
            return
        }
        vc.currentQuiz = currentQuiz

    }

    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
           performSegue(withIdentifier: "nextQuestionSegue", sender: nil)
        }
     }

}
