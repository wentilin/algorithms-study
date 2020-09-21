//
//  DynamicAlgorithm.swift
//  Algorithms
//
//  Created by wentilin on 2020/9/20.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class DynamicAlgorithm {
    /**
     题目：给你 k 种面值的硬币，面值分别为 c1, c2 ... ck，每种硬币的数量无限，
          再给一个总金额 amount，问你最少需要几枚硬币凑出这个金额，如果不可能凑出，算法返回 -1
     解法：dp(n) = { 0 | n = 0, -1 | n < 0, min(dp(n - coin) + 1, coin) | coin ∈ coins, n > 0}
     */
    static func coinChange(coins: [Int], amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        
        if amount < 0 {
            return -1
        }
        
        var res = Int.max
        for coin in coins {
            let sub = coinChange(coins: coins, amount: amount - coin)
            if sub == -1 {
                continue
            }
            
            res = min(res, 1 + sub)
        }
        
        return res == Int.max ? -1 : res
    }
}


extension DynamicAlgorithm {
    static func findTargetSumWays(nums: [Int], target: Int) -> Int {
        var result = 0
        
        func backtrack(nums: [Int], index: Int, rest: Int) {
            if index == nums.count {
                if rest == 0 {
                    result += 1
                }
                
                return
            }
            var rest = rest
            rest += nums[index]
            backtrack(nums: nums, index: index + 1, rest: rest)
            rest -= nums[index]
            
            rest -= nums[index]
            backtrack(nums: nums, index: index + 1, rest: rest)
            rest += nums[index]
        }
        
        backtrack(nums: nums, index: 0, rest: target)
        
        return result
    }
}
