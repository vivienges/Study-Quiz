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
    
    
    // UI Elements
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    // Buttons
    @IBOutlet weak var answerABtn: UIButton!
    @IBOutlet weak var answerBBtn: UIButton!
    @IBOutlet weak var answerCBtn: UIButton!
    @IBOutlet weak var answerDBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set answer labels
        
//        let buttons = [
//            answerABtn,
//            answerBBtn,
//            answerCBtn,
//            answerDBtn
//        ]
        
        let currentTitle = answerABtn.titleLabel!.text
        answerABtn.setTitle("\(String(describing: currentTitle)) + lol", for: .normal)

//        for button in buttons {
//        }
        
    }
    
    @IBAction func aBtnPressed(_ sender: Any) {
    }
    
    @IBAction func bBtnPressed(_ sender: Any) {
        print("B pressed")
    }
    
    @IBAction func cBtnPressed(_ sender: Any) {
        print("C pressed")
    }
    
    @IBAction func dBtnPressed(_ sender: Any) {
        print("D pressed")
    }
    
}
