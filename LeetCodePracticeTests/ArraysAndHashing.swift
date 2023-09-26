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
    
    func testGroupAnagrams() {
        XCTAssertEqual(solution.groupAnagrams([""]), [[""]])
        XCTAssertEqual(solution.groupAnagrams(["a"]), [["a"]])
        XCTAssertEqual(solution.groupAnagrams(["", ""]), [["",""]])
    }
    
    func testTopKFrequent() {
        XCTAssertEqual(solution.topKFrequent([1,1,1,2,2,3], 2), [1,2])
        XCTAssertEqual(solution.topKFrequent([1], 1), [1])
    }
    
    func testProductExceptSelf() {
        XCTAssertEqual(solution.productExceptSelf([1,2,3,4]), [24,12,8,6])
        XCTAssertEqual(solution.productExceptSelf([-1,1,0,-3,3]), [0,0,9,0,0])
    }
    
    func testValidSudoku() {
        let boardA: [[Character]] = [["5","3",".",".","7",".",".",".","."]
                                    ,["6",".",".","1","9","5",".",".","."]
                                    ,[".","9","8",".",".",".",".","6","."]
                                    ,["8",".",".",".","6",".",".",".","3"]
                                    ,["4",".",".","8",".","3",".",".","1"]
                                    ,["7",".",".",".","2",".",".",".","6"]
                                    ,[".","6",".",".",".",".","2","8","."]
                                    ,[".",".",".","4","1","9",".",".","5"]
                                    ,[".",".",".",".","8",".",".","7","9"]]
        
        let boardB: [[Character]] = [["8","3",".",".","7",".",".",".","."]
                                    ,["6",".",".","1","9","5",".",".","."]
                                    ,[".","9","8",".",".",".",".","6","."]
                                    ,["8",".",".",".","6",".",".",".","3"]
                                    ,["4",".",".","8",".","3",".",".","1"]
                                    ,["7",".",".",".","2",".",".",".","6"]
                                    ,[".","6",".",".",".",".","2","8","."]
                                    ,[".",".",".","4","1","9",".",".","5"]
                                    ,[".",".",".",".","8",".",".","7","9"]]
        
        let boardC: [[Character]] = [[".",".","4",".",".",".","6","3","."],
                                     [".",".",".",".",".",".",".",".","."],
                                     ["5",".",".",".",".",".",".","9","."],
                                     [".",".",".","5","6",".",".",".","."],
                                     ["4",".","3",".",".",".",".",".","1"],
                                     [".",".",".","7",".",".",".",".","."],
                                     [".",".",".","5",".",".",".",".","."],
                                     [".",".",".",".",".",".",".",".","."],
                                     [".",".",".",".",".",".",".",".","."]]
        
        let boardD: [[Character]] = [[".",".",".",".",".",".","5",".","."],
                                     [".",".",".",".",".",".",".",".","."],
                                     [".",".",".",".",".",".",".",".","."],
                                     ["9","3",".",".","2",".","4",".","."],
                                     [".",".","7",".",".",".","3",".","."],
                                     [".",".",".",".",".",".",".",".","."],
                                     [".",".",".","3","4",".",".",".","."],
                                     [".",".",".",".",".","3",".",".","."],
                                     [".",".",".",".",".","5","2",".","."]]
        
        XCTAssertTrue(solution.isValidSudoku(boardA))
        XCTAssertFalse(solution.isValidSudoku(boardB))
        XCTAssertFalse(solution.isValidSudoku(boardC))
        XCTAssertFalse(solution.isValidSudoku(boardD))
    }
}
