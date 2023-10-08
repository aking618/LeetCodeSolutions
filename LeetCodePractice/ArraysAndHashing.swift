//
//  ArraysAndHasing.swift
//  LeetCodePractice
//
//  Created by Ayren King on 9/27/23.
//

import Foundation

class ArraysAndHashing {
    /// Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
    func containsDuplicate(_ nums: [Int]) -> Bool {
        nums.reduce(into: [Int: Int]()) { result, num in
            result[num, default: 0] += 1
        }
        .values
        .contains(where: { $0 > 1 })
    }

    /// Given two strings s and t, return true if t is an anagram of s, and false
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }

        // Create dictionary of s letter occurences
        var dict = s.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }

        for char in t {
            // if the the letter exists and has an available occurrence, subtract one, else return false
            if let count = dict[char], count > 0 {
                dict[char] = count - 1
            } else {
                return false
            }
        }

        return true
    }

    func isAnagramShort(_ s: String, _ t: String) -> Bool {
        s.sorted() == t.sorted()
    }

    /// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var difference = [Int: Int]()
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

    /// Given an array of strings strs, group the anagrams together. You can return the answer in any order.
    ///
    /// This approach has a time complexity of O(n⋅m⋅log⁡m), where n is the number of strings in strs and m is the maximum length of a string in strs.
    ///
    /// The space complexity of the given solution is O(n⋅m), where n is the number of strings in the input array strs and m is the maximum length of a string in strs.
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var anagrams = [String: [String]]()

        for str in strs {
            let key = String(str.sorted())
            anagrams[key, default: []].append(str)
        }

        return Array(anagrams.values)
    }

    func groupAnagramsOneLiner(_ strs: [String]) -> [[String]] {
        Dictionary(grouping: strs, by: { String($0.sorted()) }).values.map { $0 }
    }

    /// Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.
    ///
    /// The time complexity of this approach is O(n⋅log⁡n) due to the sorting operation, where n is the length of the input array.
    ///
    /// The space complexity is also O(n), where n is the length of the input array, due to the use of a dictionary to store the frequency of each element.
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()

        for num in nums {
            dict[num, default: 0] += 1
        }

        let sorted = dict.sorted(by: { $0.value > $1.value })
        let result = sorted.map(\.key).prefix(k)

        return Array(result)
    }

    /// Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
    ///
    /// The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
    ///
    /// You must write an algorithm that runs in O(n) time and without using the division operation.
    ///
    /// O(n)
    ///
    /// NOTE: Revisit this question
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var prefix = Array(repeating: 1, count: nums.count)
        var suffix = Array(repeating: 1, count: nums.count)
        var result = Array(repeating: 0, count: nums.count)

        for i in 1 ..< nums.count {
            prefix[i] = prefix[i - 1] * nums[i - 1]
        }

        for i in (0 ..< nums.count - 1).reversed() {
            suffix[i] = suffix[i + 1] * nums[i + 1]
        }

        for i in 0 ..< result.count {
            result[i] = prefix[i] * suffix[i]
        }

        return result
    }

    /// Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
    ///
    /// Each row must contain the digits 1-9 without repetition.
    ///
    /// Each column must contain the digits 1-9 without repetition.
    ///
    /// Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
    ///
    ///
    /// Note:
    ///
    /// A Sudoku board (partially filled) could be valid but is not necessarily solvable.
    ///
    /// Only the filled cells need to be validated according to the mentioned rules.
    ///
    /// The time complexity of the given solution is O(n2)  where n is the number of cells in the Sudoku board.
    ///
    /// The space complexity of the solution is O(n), where n is the number of cells in the Sudoku board.
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = Array(repeating: Set<Character>(), count: 9)
        var columns = Array(repeating: Set<Character>(), count: 9)
        var squares = Array(repeating: Array(repeating: Set<Character>(), count: 3), count: 3)

        for i in 0 ..< 9 {
            for j in 0 ..< 9 {
                let char = board[i][j]
                guard char.isWholeNumber else { continue }

                if !rows[i].insert(char).inserted { return false }
                if !columns[j].insert(char).inserted { return false }
                if !squares[i / 3][j / 3].insert(char).inserted { return false }
            }
        }

        return true
    }

    /// Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.
    ///
    /// Complexity: O(n)
    func longestConsecutive(_ nums: [Int]) -> Int {
        let set = Set(nums)
        var longestSteak = 0

        for num in set {
            if set.contains(num - 1) { continue }

            var currentNum = num
            var currentStreak = 1

            while set.contains(currentNum + 1) {
                currentNum += 1
                currentStreak += 1
            }

            longestSteak = max(longestSteak, currentStreak)
        }

        return longestSteak
    }
}
