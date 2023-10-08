//
//  SlidingWindow.swift
//  LeetCodePractice
//
//  Created by Ayren King on 10/8/23.
//

import Foundation

class SlidingWindow {
    
    
    /// Best Time to Buy and Sell Stock
    /// You are given an array prices where prices[i] is the price of a given stock on the ith day.
    ///
    /// You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
    ///
    /// Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
    ///
    /// Brute Force Runs in O(n^2). Please refere to `maxProfitOptimized` for the Sliding Window solution
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0
        for i in 0 ..< (prices.count - 1) {
            guard prices[i] < prices[i + 1] else { continue }
            
            for j in (i + 1) ..< prices.count {
                profit = max(profit, prices[j] - prices[i])
            }
        }
        return profit
    }
    
    /// Optimized Sliding Window solution
    ///
    /// O(n)
    ///
    /// Keep track of the current minimum buy prices and only
    /// check if a profit can be made if the current price is larger than the minimum found.
    func maxProfitOptimized(_ prices: [Int]) -> Int {
        var smallestBuyPrice = Int.max
        var profit = 0
        
        
        for i in 0 ..< prices.count {
            guard prices[i] < smallestBuyPrice else {
                profit = max(profit, prices[i] - smallestBuyPrice)
                continue
            }
            
            smallestBuyPrice = prices[i]
        }
        return profit
    }
}
