//
//  JsonObject.swift
//  study-quiz
//
//  Created by Vivien Geschwind on 27.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import Foundation

let jsonString = """
[
   {
      "title":"iOS Development",
      "teacher":"Mikael Bergman",
      "description":"Käsekuchen",
      "totalQuestions":20,
      "books":[
         {
            "isbn":"1234",
            "quiz":[
               {
                  "questions":[
                     {
                        "question":"1"
                     },
                     {
                        "question":"2"
                     }
                  ],
                  "answers":[
                     {
                        "answer":"bla"
                     },
                     {
                        "answer":"blabla"
                     }
                  ]
               }
            ]
         }
      ]
   }
]
"""



let jsonData = Data(jsonString.utf8)





