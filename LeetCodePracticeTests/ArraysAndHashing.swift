//
//  ArraysAndHashing.swift
//  LeetCodePracticeTests
//
//  Created by Ayren King on 9/23/23.
//

import XCTest

@testable import LeetCodePractice

final class ArraysAndHashing: XCTestCase {
    
    let solution: Solution = Solution()

    func testContainsDuplicate() {
        XCTAssertTrue(solution.containsDuplicate([1,2,3,1]))
        XCTAssertFalse(solution.containsDuplicate([1,2,3,4]))
        XCTAssertTrue(solution.containsDuplicate([1,1,1,3,3,4,3,2,4,2]))
        XCTAssertFalse(solution.containsDuplicate([]))
        XCTAssertFalse(solution.containsDuplicate([1]))
    }

    func testIsAnagram() {
        XCTAssertTrue(solution.isAnagram("anagram", "nagaram"))
        XCTAssertFalse(solution.isAnagram("rat", "car"))
        XCTAssertTrue(solution.isAnagram("abcddef", "feddcba"))
        XCTAssertFalse(solution.isAnagram("aa", "a"))
        XCTAssertFalse(solution.isAnagram("a", "ab"))
    }
    
    func testTwoSum() {
        XCTAssertEqual(solution.twoSum([3,2,4], 6), [1,2])
        XCTAssertEqual(solution.twoSum([2,7,11,15], 9), [0,1])
        XCTAssertEqual(solution.twoSum([3,3], 6), [0,1])
    }
}
