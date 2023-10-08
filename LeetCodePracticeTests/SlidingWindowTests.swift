//
//  SlidingWindowTests.swift
//  LeetCodePracticeTests
//
//  Created by Ayren King on 10/8/23.
//

import XCTest

@testable import LeetCodePractice

class SlidingWindowTests: XCTestCase {
    let solution: SlidingWindow = .init()

    func testBestTimeToBuyStocks() {
        XCTAssertEqual(solution.maxProfitOptimized([7, 1, 5, 3, 6, 4]), 5)
        XCTAssertEqual(solution.maxProfitOptimized([7, 6, 4, 3, 1]), 0)
        XCTAssertEqual(solution.maxProfitOptimized([1, 2]), 1)
    }
}
