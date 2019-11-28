//
//  QuestionViewController.swift
//  study-quiz
//
//  Created by David Bielenberg on 15.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit


class QuestionViewController: UIViewController {

//    // var currentQuestion = Question(question: "Test", answers: ["Hallo", "Moin"], indexCorrectAnswer: 1)
//    var currentQuestion = Question()
//    // For now we will create a Quit in this screen. Later this has to be handed over from the following Views
//    var currentQuiz = Quiz()
//    
//    
//    // UI Elements
//    
//    // Buttons
//    @IBOutlet weak var answerABtn: UIButton!
//    @IBOutlet weak var answerBBtn: UIButton!
//    @IBOutlet weak var answerCBtn: UIButton!
//    @IBOutlet weak var answerDBtn: UIButton!
//    
//    // ProgressBar
//    @IBOutlet weak var quizProgressBar: UIProgressView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // MARK: ProgressBar
//        let progress = Progress(totalUnitCount: Int64(currentQuiz.totalQuestions))
//        progress.completedUnitCount = Int64(currentQuiz.completedQuestions)
//        let progressFloat = Float(progress.fractionCompleted)
//        quizProgressBar.setProgress(progressFloat, animated: true)
//
//        currentQuestion = currentQuiz.questions[currentQuiz.completedQuestions]
//        print("You answered: \(currentQuiz.completedQuestions) questions")
//        
//        self.navigationItem.title = currentQuestion.question
//        
//        answerABtn.setTitle(currentQuestion.answers[0], for: .normal)
//        answerBBtn.setTitle(currentQuestion.answers[1], for: .normal)
//        answerCBtn.setTitle(currentQuestion.answers[2], for: .normal)
//        answerDBtn.setTitle(currentQuestion.answers[3], for: .normal)
//        
//    }
//    
//    var getFeedback =  false
//
//    
//    @IBAction func aBtnPressed(_ sender: Any) {
//        let index = 0
//        print("A pressed")
//        getFeedback = self.currentQuestion.getFeedback(indexAnswer: index)
//        answerABtn.setTitle("\(currentQuestion.getFeedback(indexAnswer: index))", for: .normal)
//        
//        if currentQuestion.getFeedback(indexAnswer: index) {
//            currentQuiz.completedQuestions += 1
//            print("You answered: \(currentQuiz.completedQuestions) questions")
//        }
//        
//        self.performSegue(withIdentifier: "feedbackViewSegue", sender: self)
//    }
//    
//    @IBAction func bBtnPressed(_ sender: Any) {
//        let index = 1
//        print("B pressed")
//        answerBBtn.setTitle("\(currentQuestion.getFeedback(indexAnswer: index))", for: .normal)
//        self.performSegue(withIdentifier: "feedbackViewSegue", sender: self)
//
//    }
//    
//    @IBAction func cBtnPressed(_ sender: Any) {
//        let index = 2
//        print("C pressed")
//        print(self.currentQuestion.getFeedback(indexAnswer: index))
//        answerCBtn.setTitle("\(currentQuestion.getFeedback(indexAnswer: index))", for: .normal)
//        self.performSegue(withIdentifier: "feedbackViewSegue", sender: self)
//
//    }
//    
//    @IBAction func dBtnPressed(_ sender: Any) {
//        let index = 3
//        print("D pressed")
//        print(self.currentQuestion.getFeedback(indexAnswer: index))
//        answerDBtn.setTitle("\(currentQuestion.getFeedback(indexAnswer: index))", for: .normal)
//        self.performSegue(withIdentifier: "feedbackViewSegue", sender: self)
//
//    }
//    
//    // This is repeating code and should be optimized later
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let vc = segue.destination as? FeedbackQuestionViewController else {
//            //Handle the nil value, log, etc
//            return
//        }
//        vc.currentQuiz = currentQuiz
//        vc.booleanAnswer = self.getFeedback
//      
//    }
//    
}
