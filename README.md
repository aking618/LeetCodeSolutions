<!-- Readme file for Leetcode questions that I have answered and notes -->
# LeetCode Practice

## Table of Contents

<!-- Type of question, question name, link to question, difficulty, notes -->
| Type | # | Title | Solution | Difficulty  | Notes |
| --- | --- | ----- | -------- | ---------- | ----- |
| Array | 217 | [Contains Duplicate](https://leetcode.com/problems/contains-duplicate/) | [Swift](./LeetCodePractice/ArraysAndHashing.swift) | Easy | Iterate through the array and utilize a set to check if the element is already in the set. If it is, return true. If not, add it to the set. |
| Array | 242 | [Valid Anagram](https://leetcode.com/problems/valid-anagram/) | [Swift](./LeetCodePractice/ArraysAndHashing.swift) | Easy | Sort the two strings and compare them. If they are equal, return true. If not, return false. |
| Array | 1 | [Two Sum](https://leetcode.com/problems/two-sum/) | [Swift](./LeetCodePractice/ArraysAndHashing.swift) | Easy | Iterate through the array and store the difference between the target and the current element. If the difference is in the dictionary, return the index of the difference and the current index. If not, add the current element and its index to the dictionary. |
| Array | 49 | [Group Anagrams](https://leetcode.com/problems/group-anagrams/) | [Swift](./LeetCodePractice/ArraysAndHashing.swift) | Medium | Iterate through the array and sort each string. If the sorted string is in the dictionary, append the current string to the array in the dictionary. If not, add the sorted string as a key and the current string as the value. |
| Array | 347 | [Top K Frequent Elements](https://leetcode.com/problems/top-k-frequent-elements/) | [Swift](./LeetCodePractice/ArraysAndHashing.swift) | Medium | Iterate through the array and store the frequency of each element in a dictionary. Sort the dictionary by frequency. Return the prefix of the sorted dictionary up to k. |
| Array | 238 | [Product of Array Except Self](https://leetcode.com/problems/product-of-array-except-self/) | [Swift](./LeetCodePractice/ArraysAndHashing.swift) | Medium | Iterate through the array and store the product of all the elements to the left of the current element in a new array. Iterate through the array backwards and store the product of all the elements to the right of the current element in a new array. Iterate through the array and multiply the elements in the left array and the right array at the current index. |
| Array | 36 | [Valid Sudoku](https://leetcode.com/problems/valid-sudoku/) | [Swift](./LeetCodePractice/ArraysAndHashing.swift) | Medium | Create three different sets to store the numbers in each row, column, and box. Iterate through the board and check if the current element is in the row, column, or box. If it is, return false. If not, add it to the row, column, and box. |
| Array | 128 | [Longest Consecutive Sequence](https://leetcode.com/problems/longest-consecutive-sequence/) | [Swift](./LeetCodePractice/ArraysAndHashing.swift) | Medium | Store the input in a set. Iterate through the set and check if the current element - 1 is in the set. If it is, continue. If not, check if the current element + 1 is in the set. If it is, continue. If not, store the current element in a variable. Iterate through the set and check if the current element + 1 is in the set. If it is, increment the current element. If not, store the length of the current element in a variable. Return the maximum length. |
| Stack | 20 | [Valid Parentheses](https://leetcode.com/problems/valid-parentheses/) | [Swift](./LeetCodePractice/Stacks.swift) | Easy | Iterate through the string and push the opening parentheses onto the stack. If the current element is a closing parentheses, pop the stack and check if the current element is the corresponding opening parentheses. If it is not, return false. If it is, continue. If the stack is empty, return false. If the stack is not empty, return true. |