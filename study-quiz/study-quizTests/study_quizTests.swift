//
//  study_quizTests.swift
//  study-quizTests
//
//  Created by Vivien Geschwind on 2019-12-07.
//  Copyright © 2019 David Bielenberg. All rights reserved.
//

import XCTest
@testable import study_quiz

class study_quizTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCustomButton() {
        let button = CustomButton()
        XCTAssertEqual(button.backgroundColor, UIColor(named: "Secondary"), "The button has the incorrect background color")
        XCTAssertEqual(button.titleColor(for: .normal), UIColor(named: "White"), "The button has the incorrect title color")
        XCTAssertEqual(button.layer.cornerRadius, 8, "The button has the incorrect corner radius")
        XCTAssertEqual(button.titleLabel?.font, .boldSystemFont(ofSize: 20), "The button has the incorrect font values")
    }
    
    
    
}
