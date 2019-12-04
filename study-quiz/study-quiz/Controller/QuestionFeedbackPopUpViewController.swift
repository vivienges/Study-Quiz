//
//  QuestionFeedbackPopUpViewController.swift
//  study-quiz
//
//  Created by Nikolai Christian Lehbrink on 2019-11-30.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class QuestionFeedbackPopUpViewController: UIViewController {

    // MARK: UI Elements
    @IBOutlet weak var correctAnswerLabel: UILabel!
    @IBOutlet weak var feedbackImageView: UIImageView!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var nextQuestionOutlet: UIButton!
    @IBOutlet weak var endQuizLabel: UILabel!
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var shakeIcon: UIImageView!
    @IBOutlet weak var shakeLabel: UILabel!
    
    
    //MARK: Properties
    var rightAnswer = ""
    var answeredCorrect = false
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateShakeIcon()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        endQuizLabel.isHidden = true
        
        container.layer.cornerRadius = 12
        imageContainer.layer.cornerRadius = 8
        correctAnswerLabel.text = rightAnswer
        
        if (answeredCorrect) {
            correctAnswerLabel.textColor = UIColor.green
            feedbackImageView.image = UIImage(systemName: "checkmark.rectangle.fill")
            feedbackImageView.tintColor = UIColor(named: "Positive")
            
            
        } else {
            correctAnswerLabel.textColor = UIColor.red
            feedbackImageView.image = UIImage(systemName: "xmark.rectangle.fill")
            feedbackImageView.tintColor = UIColor(named: "Negative")
        }
        if (questionViewController?.currentQuestion == (questionViewController?.questions.count)!) {
            nextQuestionOutlet.setTitle("End Quiz", for: .normal)
//            endQuizLabel.isHidden = false
//            endQuizLabel.text = "\(questionViewController!.amountCorrectAnswers) / \(questionViewController!.questions.count) answers correct"
        }
        
        
    }
    
    
    
    
    //MARK: Setup segue
    @IBAction func nextQuestionButton(_ sender: UIButton) {
        nextQuestion()
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            nextQuestion()
        }
    }
    
    func nextQuestion() {
        if (questionViewController?.currentQuestion == questionViewController?.questions.count) {
            dismiss(animated: true)
            questionViewController?.pop()
        } else {
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
    
    func animateShakeIcon() {
        // shake Icon to highlight gesture            
        UIView.animate(withDuration: 0.5, delay: 0.4,
        options: [.repeat, .autoreverse, .curveEaseIn], animations: {
                self.shakeIcon.transform = CGAffineTransform(rotationAngle: -30)
            }) { (_) in
                // Call when animation is done
            }
        }
        
    
}
