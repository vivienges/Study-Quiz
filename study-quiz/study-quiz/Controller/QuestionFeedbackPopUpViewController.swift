//
//  QuestionFeedbackPopUpViewController.swift
//  study-quiz
//
//  Created by Nikolai Christian Lehbrink on 2019-11-30.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class QuestionFeedbackPopUpViewController: UIViewController {

    @IBOutlet weak var correctAnswerLabel: UILabel!
    @IBOutlet weak var feedbackImageView: UIImageView!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var nextQuestionOutlet: UIButton!

    
    var rightAnswer = ""
    var answeredCorrect = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        container.layer.cornerRadius = 8
        correctAnswerLabel.text = rightAnswer

        if (answeredCorrect) {
            correctAnswerLabel.textColor = UIColor.green
            feedbackImageView.image = UIImage(systemName: "checkmark.rectangle.fill")
            feedbackImageView.tintColor = UIColor.green


        } else {
            correctAnswerLabel.textColor = UIColor.red
            feedbackImageView.image = UIImage(systemName: "xmark.rectangle.fill")
            feedbackImageView.tintColor = UIColor.red
        }
        if (questionViewController?.currentQuestion == (questionViewController?.questions.count)!) {
            nextQuestionOutlet.setTitle("End Quiz", for: .normal)
        }
        

    }
    

    
    
    @IBAction func nextQuestionButton(_ sender: UIButton) {
        
        if (questionViewController?.currentQuestion == questionViewController?.questions.count) {
            performSegue(withIdentifier: "quizFeedbackSegue", sender: self)

        } else {
            print("normale Frage")
            dismiss(animated: true)
            //For every question after the first initial question in viewDidLoad in QuestionViewController
           questionViewController?.newQuestion()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let quizFeedbackVC = segue.destination as? QuizFeedbackViewController
        if (segue.identifier == "quizFeedbackSegue") {
            quizFeedbackVC?.amountCorrectAnswers = questionViewController!.amountCorrectAnswers
            quizFeedbackVC?.amountOfQuestions = questionViewController!.questions.count
            questionViewController?.dismiss(animated: true)
        }
    }

}
