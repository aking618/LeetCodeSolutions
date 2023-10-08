//
//  LinkedListsTests.swift
//  LeetCodePracticeTests
//
//  Created by Ayren King on 10/4/23.
//

import XCTest

@testable import LeetCodePractice

class LinkedListsTests: XCTestCase {
    let solution: LinkedLists = .init()

    func testReverseLinkedList() {
        let nodeA: LinkedLists.ListNode = .init(1, .init(2, .init(3, .init(4, .init(5)))))
        let solutionA: LinkedLists.ListNode = .init(5, .init(4, .init(3, .init(2, .init(1)))))
        XCTAssertEqual(solution.reverseList(nodeA), solutionA)

        let nodeB: LinkedLists.ListNode = .init(1, .init(2))
        let solutionB: LinkedLists.ListNode = .init(2, .init(1))
        XCTAssertEqual(solution.reverseList(nodeB), solutionB)

        XCTAssertEqual(solution.reverseList(nil), nil)
    }

    func testMergeSortedLinkedLists() {
        var nodeA: LinkedLists.ListNode? = .init(1, .init(2, .init(4)))
        var nodeB: LinkedLists.ListNode? = .init(1, .init(3, .init(4)))
        var result: LinkedLists.ListNode? = .init(1, .init(1, .init(2, .init(3, .init(4, .init(4))))))
        XCTAssertEqual(solution.mergeTwoLists(nodeA, nodeB), result)

        nodeA = nil
        nodeB = nil
        result = nil
        XCTAssertEqual(solution.mergeTwoLists(nodeA, nodeB), result)

        nodeA = nil
        nodeB = .init(0)
        result = .init(0)
        XCTAssertEqual(solution.mergeTwoLists(nodeA, nodeB), result)
    }
}
