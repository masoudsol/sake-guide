//
//  Sake_GuideTests.swift
//  Sake GuideTests
//
//  Created by Masoud Soleimani on 2025-06-12.
//

import XCTest
@testable import Sake_Guide

class Sake_GuideTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewModelParsesMockData() {
        // Load mock data
        guard let path = Bundle(for: type(of: self)).path(forResource: "TestData", ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            XCTFail("Missing or invalid test JSON file")
            return
        }

        let viewModel = SakeViewModel()
        viewModel.fetchStories(from: data)

        // Give time for async parsing
        let expectation = XCTestExpectation(description: "Load and parse JSON")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertEqual(viewModel.locations.count, 1)
            XCTAssertEqual(viewModel.locations.first?.name, "Tokyo Sake Bar")
            XCTAssertEqual(viewModel.locations.first?.rating, 4.7)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }
}
