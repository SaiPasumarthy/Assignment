//
//  AssignmentTests.swift
//  AssignmentTests
//
//  Created by Sai Pasumarthy on 23/11/17.
//  Copyright © 2017 SparklerTechies. All rights reserved.
//

import XCTest
@testable import Assignment

class AssignmentTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUtilityQueryParams() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let queryParam = Utility.getQueryStringParameter(url: URL(string: "https://clientarea.indegene.com/sharemax/retrieve.jsp?id=fd7b185a-58e7-4e1f-9870-654736d9fa2d")!, param: "id")
        XCTAssertEqual(queryParam, "fd7b185a-58e7-4e1f-9870-654736d9fa2d")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
