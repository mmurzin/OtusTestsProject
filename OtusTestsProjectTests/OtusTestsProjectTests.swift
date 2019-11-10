//
//  OtusTestsProjectTests.swift
//  OtusTestsProjectTests
//
//  Created by Murzin Mikhail on 10.11.2019.
//  Copyright © 2019 Murzin Mikhail. All rights reserved.
//

import XCTest
@testable import OtusTestsProject

class OtusTestsProjectTests: XCTestCase {

    var validator: FeedbackValidator = FeedbackValidator()

    func testFullName() {
        let firstName = "Mikhail"
        let lastName = "Murzin"
        let model = FeedbackModel(firstName: firstName, lastName: lastName, email: nil, message: nil)
        let exceptFullName = "\(firstName) \(lastName)"
        XCTAssertEqual(exceptFullName, model.fullName, "Fullnames are't equal")
    }
    
    func testIsFirstNameEmptyError() {
        let model = FeedbackModel(firstName: nil, lastName: "Murzin", email: "misha@misha.com", message: "1234567890")
        XCTAssertThrowsError(try validator.validateModel(model)) { error in
            XCTAssertEqual(error as! FeedbackValidator.FeedbackError, FeedbackValidator.FeedbackError.emptyFirstName)
        }
    }
    
    func testIsLastNameEmptyError() {
        let model = FeedbackModel(firstName: "Misha", lastName: nil, email: "misha@misha.com", message: "1234567890")
        XCTAssertThrowsError(try validator.validateModel(model)) { error in
            XCTAssertEqual(error as! FeedbackValidator.FeedbackError, FeedbackValidator.FeedbackError.emptyLastName)
        }
    }
    
    func testIsEmailEmptyError() {
        let model = FeedbackModel(firstName: "Misha", lastName: "Murzin", email: nil, message: "1234567890")
        XCTAssertThrowsError(try validator.validateModel(model)) { error in
            XCTAssertEqual(error as! FeedbackValidator.FeedbackError, FeedbackValidator.FeedbackError.emptyEmail)
        }
    }
    
    func testIsEmailInvalidError() {
        let model = FeedbackModel(firstName: "Misha", lastName: "Murzin", email: "misha", message: "1234567890")
        XCTAssertThrowsError(try validator.validateModel(model)) { error in
            XCTAssertEqual(error as! FeedbackValidator.FeedbackError, FeedbackValidator.FeedbackError.invalidEmail)
        }
    }
    
    func testIsInsufficientMessageText() {
        let model = FeedbackModel(firstName: "Misha", lastName: "Murzin", email: "misha@misha.com", message: "1")
        XCTAssertThrowsError(try validator.validateModel(model)) { error in
            XCTAssertEqual(error as! FeedbackValidator.FeedbackError, FeedbackValidator.FeedbackError.insufficientMessageText)
        }
    }

}
