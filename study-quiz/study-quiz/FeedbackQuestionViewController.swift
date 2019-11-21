//
//  FeedbackQuestionViewController.swift
//  study-quiz
//
//  Created by David Bielenberg on 2019-11-21.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit

class FeedbackQuestionViewController: ViewController {

    var currentQuiz = Quiz()
    

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerHeadline: UILabel!
    @IBOutlet weak var correctAnswer: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentQuestion = currentQuiz.questions[0]
        questionLabel.text = currentQuestion.question
        correctAnswer.text = currentQuestion.correctAnswer

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
//    @IBAction func pressNextQuestion(_ sender: Any) {
//        self.performSegue(withIdentifier: "nextQuestionSegue", sender: self)
//    }
}
