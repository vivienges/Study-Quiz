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
    
    let questions = ["Age?", "City born?", "Favourite Genre?", "Field of studies?"]
    let answers = [["22", "21", "19", "20"], ["Blumenthal", "Bremen", "Ritterhude", "Jaja"],["EDM", "Rock", "Psy-Trance", "Hip-Hop"], ["Media computer science", "BWL", "IT", "Hip-Hop"]]
    
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var amountCorrectAnswers = 0
    var answeredCorrect = false
    var arrayCorrect: [Int]?
    
    // ProgressBar
    @IBOutlet weak var quizProgressBar: UIProgressView!
    @IBOutlet weak var questionNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionViewController = self as QuestionViewController
        
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
        
    }
    
    @IBAction func answerButton(_ sender: AnyObject) {
        if (sender.tag == Int(rightAnswerPlacement)) {
                amountCorrectAnswers += 1
                answeredCorrect = true
            } else {
                answeredCorrect = false
            }
            
            if (currentQuestion <= questions.count) {
                performSegue(withIdentifier: "popUpSegue", sender: self)

            }
            
        }
    
    
        override func viewDidAppear(_ animated: Bool) {
                newQuestion()
        }
    
    
    //Function that displays new question
    func newQuestion()
    {

        questionNameLabel.text = questions[currentQuestion]
        rightAnswerPlacement = arc4random_uniform(4)+1
        
        //Create a button
        var button:UIButton = UIButton()
        
        var x = 1
        
        for i in 1...4 {
            //create a button
            button = (view.viewWithTag(i) as! UIButton)
            
            if (i == Int(rightAnswerPlacement)) {
                button.setTitle(answers[currentQuestion][0], for: .normal)
                
            } else {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x += 1
            }
        }
        currentQuestion += 1

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let popUpVC = segue.destination as? QuestionFeedbackPopUpViewController

       if (segue.identifier == "popUpSegue"){
            popUpVC?.rightAnswer = answers[currentQuestion-1][0]
            popUpVC?.answeredCorrect = answeredCorrect
        }
        
    }

    
    
    
        
        
    }




    
    



