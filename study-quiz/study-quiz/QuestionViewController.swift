//
//  QuestionViewController.swift
//  study-quiz
//
//  Created by David Bielenberg on 15.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit


class QuestionViewController: UIViewController {
    
    let answers = [
        "hallo",
        "tschüss",
        "irgendwas",
        "yoghurt"
    ]
    
    // var currentQuestion = Question(question: "Test", answers: ["Hallo", "Moin"], indexCorrectAnswer: 1)
    var currentQuestion = Question()
    
    
    // UI Elements
    
    // Buttons
    @IBOutlet weak var answerABtn: UIButton!
    @IBOutlet weak var answerBBtn: UIButton!
    @IBOutlet weak var answerCBtn: UIButton!
    @IBOutlet weak var answerDBtn: UIButton!
    
    // ProgressBar
    @IBOutlet weak var quizProgressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // For now we will create a Quit in this screen. Later this has to be handed over from the following Views
        let currentQuiz = Quiz()
        currentQuestion = currentQuiz.questions[0]
        
        self.navigationItem.title = currentQuestion.question
        
        answerABtn.setTitle(currentQuestion.answers[0], for: .normal)
        answerBBtn.setTitle(currentQuestion.answers[1], for: .normal)
        answerCBtn.setTitle(currentQuestion.answers[2], for: .normal)
        answerDBtn.setTitle(currentQuestion.answers[3], for: .normal)
        
    }
    
    @IBAction func aBtnPressed(_ sender: Any) {
        var index = 0
        print("A pressed")
        print(self.currentQuestion.getFeedback(indexAnswer: index))
    }
    
    @IBAction func bBtnPressed(_ sender: Any) {
        var index = 1
        print("B pressed")
        print(self.currentQuestion.getFeedback(indexAnswer: index))
    }
    
    @IBAction func cBtnPressed(_ sender: Any) {
        var index = 2
        print("C pressed")
        print(self.currentQuestion.getFeedback(indexAnswer: index))
    }
    
    @IBAction func dBtnPressed(_ sender: Any) {
        var index = 3
        print("D pressed")
        print(self.currentQuestion.getFeedback(indexAnswer: index))
    }
    
}
