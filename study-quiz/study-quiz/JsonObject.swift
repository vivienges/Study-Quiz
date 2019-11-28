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
                          
                    "answers":
                        [
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
                                "title": "vilket av följande svar ät rätt för följände beräkningsuttry: var1+var2*var3var3 ?",
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
                        ["Nej, såvida det inte finns en licens som säger att det är ok", "Tveklöst ja", "Ja om koden inte kan anses ha verkshöjd", "Ja om antalet rader understiger 200"],
                        ["Programmeraren styr hur datatypskonflikter i beräkningsuttryck löses", "Det är typkonflikter som alltid korrigeras på ett för användaren korrekt sätt", "Det innebär en automatisk initiering av variabler", "Regler i språkspecifikationen styr hur datatypskonflikter i beräkningsuttryck löses"],
                        ["Initieras vid definitionen/deklarationen", "Laddas in av kompilatorn vid programkörningen", "Kan inte skrivas ut i en printf-sats", "Måste avallokeras med free()-funktionen"],
                        ["Ett logiskt fel", "Ett exekveringsfel", "Ett syntaxfel", "Ett avgränsningsfel"],
                        ["4", "5", "7", "8"],
                        ["double sphereVolume(double);", "int sphereVolume(double);", "double spereVolume(void);", "double sphereVolume(int);"],
                        
                        ["Förbättra programvaran", "Titta på källkoden men inte ändra den", "Förändra programvaran, men du måste i så fall distribuera dina förändringar", "Distribuera mjukvaran"]
                          ]
                    
                    }
                ]
           }

     
    {
       "title":"user research",
       "teacher":"Bruce Ferwerda",
       "description":"The course introduces the students to user research concepts, methods and techniques as they are used throughout the design process to identify needs, behavioral patterns, and functionalities. It provides students with a basic understanding of the differences between interviews and surveys, cultural probes and ethnography, behavioral or attitudinal approaches, qualitative and quantitative methodologies, and practically illustrates how to turn user research results into communicable synthetic deliverables such as personas or user journeys.
       The course also stresses the importance of culture and context in the practice of user research.",
       "totalQuestions":10,
       "books":[
          {
             "isbn":"0123848695",
             "title": "Observing the User Experience",
             "publisher": "Morgan Kaufmann",
             "releaseYear": "2010",
             "coverImage": "efwgr",
             "summary": "ewgr",
             "description": "wgr",
            "quiz": [
                    {
                    "questions":
                            [
                                    {
                                      "title": "Which of the following is most important in user-centered design?",
                                      "answeredRight": false
                                    },
                                    {
                                        "title": "Usability testing for a Web site can be performed with:",
                                        "answeredRight": false
                                    },
                                    {
                                        "title": "Which is most important to a user experience designer?",
                                        "answeredRight": false
                                    },
                                    {
                                        "title": "Diary studies ask participants to capture information about their activities, habits,
                                        thoughts, or opinions as they go about their daily activities. Diaries allow a
                                        researcher to collect, in situ, longitudinal data from a large sample. Diaries are:",
                                        "answeredRight": false
                                    },
                                    {
                                        "title": "There are many definitions for task analysis, but a simple interpretation is:",
                                        "answeredRight": false
                                    }
                            ],
                          
                    "answers":[
                        ["Iterative design and user testing", "An object-oriented development process", "Regular design demonstrations", "Including every function each user wants"],
                        ["All the above", "Detailed screen designs", "Final graphical representations","Illustrations of navigational controls"],
                        ["Pleasing the product user", "Pleasing the team", "Pleasing the client/boss", "Pleasing the stakeholders of the strategy that was originally set out in the kick off meeting"],
                        ["Can be both additional and behavioral method", "An attitudinal method", "A behavioral method", "none of them"],
                        ["Who does what and why", "The overall task broken into its subtasks and actions", "What is the goal and who achieves it", "The job and the people doing the job"]
                        
                    ]
                    
                    }
                ]
           },
        {
            "isbn":"149195129X",
            "title": "UX Research",
            "publisher": "O'Reilly Media",
            "releaseYear": "2010",
            "coverImage": "efwgr",
            "summary": "ewgr",
            "description": "wgr",
           "quiz": [
                   {
                   "questions":
                               [
                           {
                             "title": "Some affordances are obvious and are some learned. What are/is a typical factor(s) that influence peoples’ affordances?",
                             "answeredRight": false
                           },
                           {
                               "title": "If one wished to understand how people engage in tasks in the “real world” in order to design interactions to support this, what method would you use?",
                               "answeredRight": false
                           },
                           {
                               "title": "What is an advantage of focus groups?",
                               "answeredRight": false
                           },
                           {
                               "title": "What is true about surveys?",
                               "answeredRight": false
                           },
                           {
                               "title": "You drag a folder to make a copy of its contents. An animation appears on the screen, showing files moving from one folder to another. This is an example of which of the following:",
                               "answeredRight": false
                           }
                           ],
                         
                   "answers":[
                       ["A,B,and C", "Culture", "Knowledge", "Experience"],
                       ["Contextual inquiry", "Focus groups", "Surveys","Lab experiment"],
                       ["Group dynamics", "Group think", "Social demand characteristics", "You can get a clear picture of desires and needs"],
                       ["All the options are right", "Surveys are a set of questions that create a structured way of asking a
                       large group of people to describe themselves, their interests, and their
                       preferences", "Surveys yield quantitative results with more certainty than qualitative
                       methods", "Surveys can easily go wrong, leading to inaccurate, inconclusive or even
                       deceptive results],
                       ["Feedback", "Affordance", "Mapping", "Visibility"]
                       
                         ]
                   
                   }
               ]

            }

       ]
    }

]
"""




let jsonData = Data(jsonString.utf8)






