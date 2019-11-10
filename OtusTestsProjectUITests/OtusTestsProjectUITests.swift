//
//  OtusTestsProjectUITests.swift
//  OtusTestsProjectUITests
//
//  Created by Murzin Mikhail on 10.11.2019.
//  Copyright © 2019 Murzin Mikhail. All rights reserved.
//

import XCTest

class OtusTestsProjectUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFillForm() {
        
        let app = XCUIApplication()
        app.launch()
        app.textFields["First name"].tap()
        app.textFields["First name"].typeText("Misha")
        app.textFields["Last name"].tap()
        app.textFields["Last name"].typeText("Murzin")
        app.textFields["Email"].tap()
        app.textFields["Email"].typeText("misha@misha.com")
        let messageTextView =  app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        messageTextView.tap()
        messageTextView.typeText("1234567890")
        app.buttons["Send"].tap()
        let statusLabelText = app.staticTexts["statusLabelIndentifier"].label
        XCTAssert(statusLabelText == "Feedback was sent")
    }
}
