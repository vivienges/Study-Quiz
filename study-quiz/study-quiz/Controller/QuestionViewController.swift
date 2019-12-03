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
    
    // var currentQuestion = Question(question: "Test", answers: ["Hallo", "Moin"], indexCorrectAnswer: 1)
    //    var currentQuestion = Question()
    // For now we will create a Quit in this screen. Later this has to be handed over from the following Views
    //    var currentQuiz = Quiz()
    
    var questions: [Question] = []
    var answers: [[String]] = [[]]
    
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var amountCorrectAnswers = 0
    var answeredCorrect = false
    var arrayCorrect: [Int]?
    
    var currentQuiz = Quiz()
    
    
    
    
    
    
    // ProgressBar
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
    
    
    //Function that displays new question
    func newQuestion()
    {
        
        questionNameLabel.text = questions[currentQuestion].questionTitle
        rightAnswerPlacement = arc4random_uniform(4)+1
        
        //Create a button
        var button:UIButton = UIButton()
        
        var x = 1
        
        for i in 1...4 {
            //create a button
            
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









