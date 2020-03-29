//
//  TestForTelstraTests.swift
//  TestForTelstraTests
//
//  Created by Regan Russell on 29/3/20.
//  Copyright © 2020 Regan Russell. All rights reserved.
//

import XCTest
@testable import TestForTelstra

class TestForTelstraTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetch() {

        let expect = expectation(description: "Fetch Succeeds")
        
        let interactor = DataModelInteractor()
        
        interactor.fetch { _ in
            expect.fulfill()
            print( "Fetched" )
        }
        waitForExpectations(timeout: 3.0) { (_) -> Void in
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
