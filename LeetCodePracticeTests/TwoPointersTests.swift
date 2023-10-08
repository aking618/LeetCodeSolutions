//
//  TwoPointersTests.swift
//  LeetCodePracticeTests
//
//  Created by Ayren King on 9/27/23.
//

import XCTest

@testable import LeetCodePractice

class TwoPointersTests: XCTestCase {
    let solution: TwoPointers = .init()

    func testIsPalindrome() {
        XCTAssertTrue(solution.isPalindrome("A man, a plan, a canal: Panama"))
        XCTAssertFalse(solution.isPalindrome("race a car"))
        XCTAssertTrue(solution.isPalindrome(" "))
        XCTAssertTrue(solution.isPalindrome("3A bB a3"))
    }

    func testTwoSum() {
        XCTAssertEqual(solution.twoSum([2, 7, 11, 15], 9), [1, 2])
        XCTAssertEqual(solution.twoSum([2, 3, 4], 6), [1, 3])
        XCTAssertEqual(solution.twoSum([-1, 0], -1), [1, 2])
    }

    func testThreeSum() {
        XCTAssertEqual(Set(solution.threeSum([-1, 0, 1, 2, -1, -4])), Set([[-1, -1, 2], [-1, 0, 1]]))
        XCTAssertEqual(Set(solution.threeSum([0, 1, 1])), Set([]))
        XCTAssertEqual(Set(solution.threeSum([0, 0, 0])), Set([[0, 0, 0]]))
    }

    func testContainerWithMostWater() {
        XCTAssertEqual(solution.maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]), 49)
        XCTAssertEqual(solution.maxArea([1, 1]), 1)
    }
    
    func testNeedleHaystack() {
        XCTAssertEqual(solution.strStr("sadbutsad", "sad"), 0)
        XCTAssertEqual(solution.strStr("leetcode", "leeto"), -1)
    }
}
