//
//  StackTests.swift
//  LeetCodePracticeTests
//
//  Created by Ayren King on 9/26/23.
//

import XCTest

@testable import LeetCodePractice

class StackTests: XCTestCase {
    
    let solution = Stacks()
    
    func testIsValidParenthesis() {
        let testCases = [("()", true), ("()[]{}", true), ("((", false), ("(()]", false), ("({[]}())", true), ("[", false)]
        
        for testCase in testCases {
            XCTAssertEqual(solution.isValidParenthesis(testCase.0), testCase.1, "\(testCase.0) failed, expected \(testCase.1)")
        }
    }
    
    func testMinStack() {
        let stack = Stacks.MinStack()
        stack.push(-2)
        stack.push(0)
        stack.push(-3)
        
        XCTAssertEqual(stack.getMin(), -3)
        
        stack.pop()
        
        XCTAssertEqual(stack.top(), 0)
        
        XCTAssertEqual(stack.getMin(), -2)
    }
    
    func testEvalRPN() {
        XCTAssertEqual(solution.evalRPN(["2","1","+","3","*"]), 9)
        XCTAssertEqual(solution.evalRPN(["4","13","5","/","+"]), 6)
        XCTAssertEqual(solution.evalRPN(["10","6","9","3","+","-11","*","/","*","17","+","5","+"]), 22)
    }
    
    func testGenerateParanthesis() {
        XCTAssertEqual(solution.generateParenthesis(1), ["()"])
        XCTAssertEqual(Set(solution.generateParenthesis(3)), Set(["((()))","(()())","(())()","()(())","()()()"]))
    }
    
    func testDailyTemperature() {
        XCTAssertEqual(solution.dailyTemperatures([73,74,75,71,69,72,76,73]), [1,1,4,2,1,1,0,0])
        XCTAssertEqual(solution.dailyTemperatures([30,40,50,60]), [1,1,1,0])
        XCTAssertEqual(solution.dailyTemperatures([30,60,90]), [1,1,0])
    }
    
    func testCarFleet() {
        XCTAssertEqual(solution.carFleet(12, [10,8,0,5,3], [2,4,1,1,3]), 3)
        XCTAssertEqual(solution.carFleet(10, [3], [3]), 1)
        XCTAssertEqual(solution.carFleet(100, [0,2,4], [4,2,1]), 1)
    }
}
