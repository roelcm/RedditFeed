//
//  RedditFeedUITests.swift
//  RedditFeedUITests
//
//  Created by Roel Castano on 1/26/23.
//

import XCTest

final class RedditFeedUILoginTests: XCTestCase {

    func loginTest() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let loginButton = app.buttons["loginButton"]
        XCTAssert(loginButton.exists)
        XCTAssert(loginButton.isEnabled)
    }

}
