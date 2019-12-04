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
    
    @IBOutlet weak var horizontalConstraint: NSLayoutConstraint!
    
    //MARK: Properties
    var rightAnswer = ""
    var answeredCorrect = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        endQuizLabel.isHidden = true
        horizontalConstraint.constant -= view.bounds.width
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        horizontalConstraint.constant = 0
        
        UIView.animate(withDuration: 0.6, delay: 0, options: [.curveEaseInOut,.preferredFramesPerSecond60], animations: {
            self.container.superview?.layoutIfNeeded()
            self.feedbackImageView.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)

        }, completion: nil)
        UIView.animate(withDuration: 0.6, delay: 0.5, animations: {
            self.feedbackImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    //MARK: Setup segue
    @IBAction func nextQuestionButton(_ sender: UIButton) {
        horizontalConstraint.constant += view.bounds.width
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut,.preferredFramesPerSecond60], animations: {

            self.container.superview?.layoutIfNeeded()
        }, completion:nil)
        
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
    
}
