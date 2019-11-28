//
//  JsonObject.swift
//  study-quiz
//
//  Created by Vivien Geschwind on 27.11.19.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import Foundation

let jsonString =
"""
[
{
   "title":"iOS Development",
   "teacher":"Mikael Bergman",
   "description":"Käsekuchen",
   "totalQuestions":20,
   "books":[
      {
         "isbn":"1234",
         "title": "df",
         "publisher": "efrg",
         "releaseYear": "efgr",
         "coverImage": "efwgr",
         "summary": "ewgr",
         "description": "wgr",
        "quiz": [
                {
                "questions":
                            [
                          {
                              "title": "wie gehts?",
                              "answeredRight": false
                          },
                        {
                            "title": "wie gehts?",
                            "answeredRight": false
                        },
                        {
                            "title": "wie gehts?",
                            "answeredRight": false
                        }
                        ],
                      
                "answers":[
                      ["Answer1", "Answer1", "Answer1", "Answer1"]
                      ]
                
                }
            ]
       }
   ]
}
]
"""




let jsonData = Data(jsonString.utf8)






