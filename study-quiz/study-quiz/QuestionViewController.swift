//
//  QuestionViewController.swift
//  study-quiz
//
//  Created by David Bielenberg on 15.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import UIKit


class QuestionViewController: UIViewController {

    // var currentQuestion = Question(question: "Test", answers: ["Hallo", "Moin"], indexCorrectAnswer: 1)
    var currentQuestion = Question()
    // For now we will create a Quit in this screen. Later this has to be handed over from the following Views
    var currentQuiz = Quiz()
    
    
    // UI Elements
    
    // Buttons
    
    // ProgressBar
    @IBOutlet weak var quizProgressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: ProgressBar
        let progress = Progress(totalUnitCount: Int64(currentQuiz.totalQuestions))
        progress.completedUnitCount = Int64(currentQuiz.completedQuestions)
        let progressFloat = Float(progress.fractionCompleted)
        quizProgressBar.setProgress(progressFloat, animated: true)

        currentQuestion = currentQuiz.questions[currentQuiz.completedQuestions]
        print("You answered: \(currentQuiz.completedQuestions) questions")
        
        self.navigationItem.title = currentQuestion.question

        
        
    }


    
    


    
    // This is repeating code and should be optimized later
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? FeedbackQuestionViewController else {
            //Handle the nil value, log, etc
            return
        }
        vc.currentQuiz = currentQuiz
      
    }
    
}
