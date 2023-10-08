//
//  TwoPointers.swift
//  LeetCodePractice
//
//  Created by Ayren King on 9/27/23.
//

class TwoPointers {
    /// A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.
    ///
    /// Given a string s, return true if it is a palindrome, or false otherwise.
    func isPalindrome(_ s: String) -> Bool {
        // Lint string
        let lintedInput: [Character] = s.lowercased().filter { $0.isLetter || $0.isNumber }

        var left = 0
        var right = lintedInput.count - 1

        while left <= right {
            if lintedInput[left] != lintedInput[right] {
                return false
            }

            left += 1
            right -= 1
        }

        return true
    }

    /// Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number.
    ///
    /// Let these two numbers be numbers[index1] and numbers[index2] where 1 <= index1 < index2 < numbers.length.
    ///
    /// Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count - 1

        var result = [Int]()

        while left < right {
            let sum = numbers[right] + numbers[left]

            if sum == target {
                result = [left + 1, right + 1]
                break
            }

            if sum > target {
                right -= 1
                continue
            }

            if sum < target {
                left += 1
                continue
            }
        }

        return result
    }

    /// Given an integer array nums, return all the triplets
    /// [nums[i], nums[j], nums[k]] such that
    /// i != j, i != k, and j != k,
    /// and nums[i] + nums[j] + nums[k] == 0.
    ///
    /// Notice that the solution set must not contain duplicate triplets.
    ///
    /// Time Complexity: O(n^2)
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sorted = nums.sorted()
        var result: Set<[Int]> = []

        for i in 0 ..< sorted.count {
            var left = i + 1
            var right = sorted.count - 1

            while left < right {
                let sum = sorted[i] + sorted[left] + sorted[right]

                if sum == 0 {
                    result.insert([sorted[i], sorted[left], sorted[right]])
                    left += 1
                    continue
                }

                if sum < 0 {
                    left += 1
                    continue
                }

                if sum > 0 {
                    right -= 1
                    continue
                }
            }
        }

        return Array(result)
    }

    /// Container With Most Water
    ///
    /// You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).
    ///
    /// Find two lines that together with the x-axis form a container, such that the container contains the most water.
    ///
    /// Return the maximum amount of water a container can store.
    ///
    /// Notice that you may not slant the container.
    func maxArea(_ height: [Int]) -> Int {
        var maxWaterArea = 0
        var left = 0
        var right = height.count - 1

        while left < right {
            let area = (right - left) * min(height[left], height[right])

            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }

            maxWaterArea = max(maxWaterArea, area)
        }

        return maxWaterArea
    }

    /// Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard haystack.count > needle.count else { return -1 }
        let haystack = Array(haystack)

        for (i, char) in haystack.enumerated() {
            if char == needle.first,
               needle.count + 1 < haystack.count,
               String(haystack[i ..< needle.count + i]) == needle
            {
                return i
            }
        }

        return -1
    }
}
