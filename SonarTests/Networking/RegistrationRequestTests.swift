//
//  RegistrationRequestTests.swift
//  SonarTests
//
//  Created by NHSX on 3/23/20.
//  Copyright © 2020 NHSX. All rights reserved.
//

import XCTest
@testable import Sonar

class RegistrationRequestTests: XCTestCase {
    
    let pushToken: String = "someBase64StringWeGotFromFirebase=="
    
    var request: RegistrationRequest!
        
    override func setUp() {
        super.setUp()
        
        request = RegistrationRequest(pushToken: pushToken)
    }
    
    func testMethod() {
        XCTAssertTrue(request.isMethodPOST)
    }
    
    func testPath() {
        XCTAssertEqual(request.urlable, .path("/api/devices/registrations"))
    }
    
    func testBody() {
        XCTAssertEqual(String(data: request.body!, encoding: .utf8),
"""
{"pushToken":"someBase64StringWeGotFromFirebase=="}
""")
    }
    
    func testHeaders() {
        XCTAssertEqual(request.headers.count, 1)
        XCTAssertEqual(request.headers["Content-Type"], "application/json")
    }

}
