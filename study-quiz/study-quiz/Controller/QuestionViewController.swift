//
//  QuestionViewController.swift
//  study-quiz
//
//  Created by David Bielenberg on 15.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

var questionViewController : QuestionViewController?

class QuestionViewController: UIViewController {
    
    // MARK: Properties
    var questions: [Question] = []
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var amountCorrectAnswers = 0
    var answeredCorrect = false
    var arrayCorrect: [Int]?
    
    //MARK: Reference for the quiz that is handed over from QuizViewController
    var currentQuiz = Quiz()
    
    //MARK: ProgressBar UI Elements
    @IBOutlet weak var quizProgressBar: UIProgressView!
    @IBOutlet weak var questionNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionViewController = self as QuestionViewController
        
        for question in currentQuiz.questions {
            
            questions.append(question)
        }
        newQuestion()        
        
    }
    @IBAction func unwindToQuestionVC(segue:UIStoryboardSegue) {
        currentQuestion = 0
        amountCorrectAnswers = 0
        newQuestion()
    }
    
    @IBAction func answerButton(_ sender: AnyObject) {
        if (sender.tag == Int(rightAnswerPlacement)) {
            amountCorrectAnswers += 1
            answeredCorrect = true
            currentQuiz.questions[currentQuestion-1].answeredRight = true
            
        } else {
            answeredCorrect = false
            currentQuiz.questions[currentQuestion-1].answeredRight = false
        }
        
        if (currentQuestion <= questions.count) {
//            navigationController?.popToRootViewController(animated: true)
            performSegue(withIdentifier: "popUpSegue", sender: self)
        }
        
    }
    
    func pop() {
        self.navigationController?.viewControllers.removeLast()
    }
    
    
    //MARK: Display new question
    func newQuestion() {
        questionNameLabel.text = questions[currentQuestion].questionTitle
        rightAnswerPlacement = arc4random_uniform(4)+1

        var button:UIButton = UIButton()
        var x = 1

        //MARK: Set answer to buttons
        for i in 1...4 {
            button = (view.viewWithTag(i) as! UIButton)
            
            if (i == Int(rightAnswerPlacement)) {
                button.setTitle(currentQuiz.answers[currentQuestion][0], for: .normal)  // nicer way to express currentQuiz..?
                
            } else {
                button.setTitle(currentQuiz.answers[currentQuestion][x], for: .normal)
                x += 1
            }
            
        }
        
        if (currentQuestion < (questions.count)) {
            currentQuestion += 1   
        }
        
        // MARK: ProgressBar
        let progress = Progress(totalUnitCount: Int64(currentQuiz.questions.count))
        progress.completedUnitCount = Int64(currentQuestion-1)
        let progressFloat = Float(progress.fractionCompleted)
        quizProgressBar.setProgress(progressFloat, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let popUpVC = segue.destination as? QuestionFeedbackPopUpViewController
        if (segue.identifier == "popUpSegue"){
            popUpVC?.rightAnswer = currentQuiz.answers[currentQuestion-1][0]
            popUpVC?.answeredCorrect = answeredCorrect
        }
    }
    
    
    

    
    
    
    
    
    
}









