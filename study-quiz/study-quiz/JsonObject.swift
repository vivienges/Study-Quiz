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
   "title":"Object-oriented Software Development",
   "teacher":"johannes schmidt",
   "description":"The purpose of the course is to provide students with knowledge required to carry out object-oriented design in accordance with established practice, and to be able to implement the results of said design in program code.",
   "totalQuestions":10,
   "books":[
      {
         "isbn":"9780131489066",
         "title": "applying UML and patterns",
         "publisher": "Prentice Hall PTR",
         "releaseYear": "2005",
         "coverImage": "efwgr",
         "summary": "ewgr",
         "description": "wgr",
        "quiz": [
                {
                "questions":
                            [
                        {
                          "title": "Which is a reason for IT-project failure?",
                          "answeredRight": false
                        },
                        {
                            "title": "What happens according to the triple contraint if you reduce cost (budget)?",
                            "answeredRight": false
                        },
                        {
                            "title": "A Project is ...?",
                            "answeredRight": false
                        },
{
                            "title": "Use cases are...?",
                            "answeredRight": false
                        },
{
                            "title": "We consider responsibilities in the following two categories?",
                            "answeredRight": false
                        },
                        {
                            "title": "Which of the following is no GoF pattern?",
                            "answeredRight": false
                        },
                        {
                            "title": "In the context of software development, which two types of requirements did we define?",
                            "answeredRight": false
                        },
                        {
                            "title": "A domain model does not contain…",
                            "answeredRight": false
                        },
                        {
                            "title": "What is good design?",
                            "answeredRight": false
                        },
                        {
                            "title": "Which of the following is no GRASPattern?",
                            "answeredRight": false
                        }
                        ],
                      
                "answers":[
                    ["fast-changing technology", "underuse of the waterfall model", "stable requirements", "overuse of agile methods"],
                    ["increase time and/or reduce scope", "increase time and/or cost", "reduce time and/or increase scope", "increase cost and/or reduce scope"],
                    ["a temporary endeavour", "a long term goal", "a work evironment", "a permanent endeavor"],
                    ["used for requirements analysis", "used for testing", "evaluated by off-stage actors", "created during implementation phase"],
                    ["doing and knowing", "having and owning", "knowing and owning", "doing and having"],
                    ["Furniture", "Composite", "Facade", "Factory"],
                    ["functional and non-functional", "operative and non-operative", "functional and restrictional", "operative and co-operative"],
                    ["methods", "associations", "attributes", "multiplicities"],
                    ["flexible", "beautiful", "fixed", "determined"],
                    ["Low Cohesion", "Controller", "Indirection", "Low Coupling"]

                      ]
                
                }
            ]
       }

   ]
},
{
   "title":"introduktion till programmering",
   "teacher":"anders cartensen",
   "description":"Kursen ämnar ge studenten grundläggande förståelse för och kunskaper i strukturerad programmering, inklusive modellering, programdesign, och implementation med hjälp av imperativ programmering. Kursen ämnar även ge studenten en kortare introduktion till olika licensformer och andra för programmerare relevanta immaterialrättsliga frågor.",
   "totalQuestions":8,
   "books":[
      {
         "isbn":"0201721686",
         "title": "C++ from the Beginning",
         "publisher": "Addison-Wesley;",
         "releaseYear": "2010",
         "coverImage": "efwgr",
         "summary": "ewgr",
         "description": "wgr",
        "quiz": [
                {
                "questions":
                            [
                        {
                          "title": "Vad menas med företrädesregler för operatorer i beräkningsuttryck?",
                          "answeredRight": false
                        },
                        {
                            "title": "Får jag klippa och klistra kod från internet och använda denna i program som jag själv gör publikt tillgängligt?",
                            "answeredRight": false
                        },
                        {
                            "title": "Vad innebär explicit typkonvertering?",
                            "answeredRight": false
                        },
                        {
                            "title": "Vilka av följande alternativ beskriver tre viktiga egenskaper för en konstant i C",
                            "answeredRight": false
                        },
                        {
                            "title": "Vilket av följande feltyper innebär att programmet ser ut att fungera men ger sporadiskt felaktiga beräkningar?",
                            "answeredRight": false
                        },
                        {
                            "title": "Vilket av följande feltyper innebär att programmet ser ut att fungera men ger sporadiskt felaktiga beräkningar?",
                            "answeredRight": false
                        },
                        {
                            "title": "Vilken av följande funktionsdeklarationer är mest lämplig för att räkna ut volymen av en sfär , om globala variabler inte är tillåtna?",
                            "answeredRight": false
                        },
                        {
                            "title": "Vilken av följande funktionsdeklarationer är mest lämplig för att räkna ut volymen av en sfär , om globala variabler inte är tillåtna?",
                            "answeredRight": false
                        },
                        {
                            "title": "Öppen Källkod, Free Software är namn på mjukvara som är släppt under en licens som tillåter ett dig till?",
                            "answeredRight": false
                        }
                        ],
                      
                "answers":[
                    ["De med högre prioritet utförs före de med lägre prioritet", "Bestämmer hur operatorer kan företräda varandra och bilda en kombination av operatorer t.ex. +=, *=, ++ o.s.v..", "Operatorer med samma associetivitet har företräde antingen från vänster till höger eller från höger till vänster ", "Kallas också selektivitetsregler och avgör ett beräkningsuttrycks prioritet"],
                    ["Answer2", "Answer2", "Answer2", "Answer2"],
                    ["Answer1", "Answer1", "Answer1", "Answer1"],
                    ["Answer1", "Answer1", "Answer1", "Answer1"],
                    ["Answer1", "Answer1", "Answer1", "Answer1"],
                    ["Answer1", "Answer1", "Answer1", "Answer1"],
                    ["Answer1", "Answer1", "Answer1", "Answer1"],
                    ["Answer3", "Answer3", "Answer3", "Answer3"]

                      ]
                
                }
            ]
       },
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
                           "title": "Question1?",
                           "answeredRight": false
                       },
                     {
                         "title": "Question2?",
                         "answeredRight": false
                     },
                     {
                         "title": "Question3?",
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






