//
//  Solution.swift
//  LeetCodePractice
//
//  Created by Ayren King on 9/23/23.
//

class Solution {

    /// Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return nums.reduce(into: [Int:Int]()) { (result, num) in
            result[num] = 1 + (result[num] ?? 0)
        }
        .values
        .contains(where: { $0 > 1 })
    }
    
    /// Given two strings s and t, return true if t is an anagram of s, and false
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard t.count == s.count else { return false }
        
        let sLetters = s.reduce(into: [Character:Int]()) { $0[$1] = 1 + ($0[$1] ?? 0)}
        let tLetters = t.reduce(into: [Character:Int]()) { $0[$1] = 1 + ($0[$1] ?? 0)}
        
        guard sLetters.keys.count == tLetters.keys.count else { return false }
        
        let difference: [Bool] = sLetters.map { sLetter in
            guard let tCount = tLetters[sLetter.key] else { return false }
            
            return tCount <= sLetter.value
        }
        
        return difference.reduce(true, { $0 && $1 })
    }
    
    /// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var difference = [Int:Int]()
        var result = [Int]()
        
        for (index, num) in nums.enumerated() {
            if let neededNum = difference[num], neededNum != index {
                result = [neededNum, index]
            }
            
            let diff = target - num
            difference[diff] = index
        }
        
        return result
    }
}
