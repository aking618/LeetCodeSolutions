//
//  Solution.swift
//  LeetCodePractice
//
//  Created by Ayren King on 9/23/23.
//

class Stacks {
    
    // MARK: - Stacks

    /// Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
    ///
    /// An input string is valid if:
    ///
    /// 1. Open brackets must be closed by the same type of brackets.
    ///
    /// 2. Open brackets must be closed in the correct order.
    ///
    /// 3. Every close bracket has a corresponding open bracket of the same type
    func isValidParenthesis(_ s: String) -> Bool {
        guard s.count % 2 == 0 else { return false }
        var stack = [Character]()

        for char in s {
            switch char {
            case "(":
                stack.append(")")
            case "{":
                stack.append("}")
            case "[":
                stack.append("]")
            default:
                if stack.isEmpty || stack.removeLast() != char {
                    return false
                }
            }
        }

        return stack.isEmpty
    }
    
    /// You are given an array of strings tokens that represents an arithmetic expression in a Reverse Polish Notation.
    ///
    /// Evaluate the expression. Return an integer that represents the value of the expression.
    ///
    /// Note that:
    ///
    /// - The valid operators are '+', '-', '*', and '/'.
    /// - Each operand may be an integer or another expression.
    /// - The division between two integers always truncates toward zero.
    /// - There will not be any division by zero.
    /// - The input represents a valid arithmetic expression in a reverse polish notation.
    /// - The answer and all the intermediate calculations can be represented in a 32-bit integer.
    ///
    /// Time complexity: O(n)
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        
        for token in tokens {
            switch token {
            case "+":
                let sum = stack.removeLast() + stack.removeLast()
                stack.append(sum)
            case "-":
                let operand = stack.removeLast()
                let difference = stack.removeLast() - operand
                stack.append(difference)
            case "*":
                let product = stack.removeLast() * stack.removeLast()
                stack.append(product)
            case "/":
                let operand = stack.removeLast()
                let quotient = stack.removeLast() / operand
                stack.append(quotient)
            default:
                stack.append(Int(token)!)
            }
        }
        
        return stack.last!
    }
    
    /// Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
    func generateParenthesis(_ n: Int) -> [String] {
        var validParenthesis = [String]()
        
        var allCombos = Set<String>()
        
        var allCombosLength: Int = 1
        for _ in 0 ..< (n * 2) - 2 { allCombosLength *= 2 }
        
        while allCombos.count < allCombosLength {
            var combo = ""
            
            for i in 0 ..< n * 2 {
                if i == 0 {
                    combo += "("
                    continue
                } else if i == (n * 2) - 1 {
                    combo += ")"
                    continue
                }
                
                
                combo += ["(", ")"].randomElement()!
            }
            
            allCombos.insert(combo)
        }
        
        for combo in allCombos {
            if isValidParenthesis(combo) {
                validParenthesis.append(combo)
            }
        }
        
        return validParenthesis
    }
}
