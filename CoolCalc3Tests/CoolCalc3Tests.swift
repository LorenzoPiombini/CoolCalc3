//
//  CoolCalc3Tests.swift
//  CoolCalc3Tests
//
//  Created by Lorenzo piombini on 9/26/20.
//

import XCTest
@testable import CoolCalc3

class CoolCalc3Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testchekingOverFlow(){
        XCTAssert(chekingOverFlow(forThisResult: 200000000) == "200000000" )
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
