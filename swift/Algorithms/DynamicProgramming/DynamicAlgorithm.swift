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


extension DynamicAlgorithm {
    /**
     题目：返回一组数的所有子集
     */
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var tmp: [Int] = []
        backtrack(nums, i: 0, res: &res, tmp: &tmp)
        return res
    }

    func backtrack(_ nums: [Int], i: Int, res: inout [[Int]], tmp: inout [Int]) {
        res.append(tmp)
        for j in i..<nums.count {
            tmp.append(nums[i])
            backtrack(nums, i: j+1, res: &res, tmp: &tmp)
            tmp.removeLast()
        }
    }
}

extension DynamicAlgorithm {
    /**
     题目：公共最长子串（可不连续）
     */
    static func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let chs1 = text1.map{ $0 }
        let chs2 = text2.map{ $0 }
        var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: chs2.count+1), count: chs1.count+1)
        for i in 1...chs1.count {
            for j in 1...chs2.count {
                if chs1[i-1] == chs2[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        
        return dp[chs1.count][chs2.count]
    }
}

extension DynamicAlgorithm {
    /**
     题目：公共最长连续子串
     */
    static func longestCommonContinueSubsequence(_ text1: String, _ text2: String) -> Int {
        let chs1 = text1.map{ $0 }
        let chs2 = text2.map{ $0 }
        var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: chs2.count+1), count: chs1.count+1)
        var maxLen = 0
        for i in 1...chs1.count {
            for j in 1...chs2.count {
                if chs1[i-1] == chs2[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                }
                maxLen = max(maxLen, dp[i][j])
            }
        }
        
        return maxLen
    }
}

extension DynamicAlgorithm {
    /**
     题目：最小修改距离
     */
    static func minDistance(_ word1: String, _ word2: String) -> Int {
        let len1 = word1.count
        let len2 = word2.count
        if len1 == 0 {
            return len2
        }
        if len2 == 0 {
            return len1
        }

        var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: len2+1), count: len1+1)
        for i in 0...len1 {
            dp[i][0] = i
        }
        for i in 0...len2 {
            dp[0][i] = i
        }

        for i in 1...len1 {
            for j in 1...len2 {
                let left = dp[i-1][j] + 1
                let down = dp[i][j-1] + 1
                var left_down = dp[i-1][j-1]
                if word1[word1.index(word1.startIndex, offsetBy: i-1)] != word2[word2.index(word2.startIndex, offsetBy: j-1)] {
                    left_down += 1
                }

                dp[i][j] = min(left, min(down, left_down))
            }
        }

        return dp[len1][len2]
    }
}

extension DynamicAlgorithm {
    /**
     题目：最长回文子串
     */
    static func longestPalindrome(_ s: String) -> String {
        if s.count <= 1 {
            return s
        }
        
        var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        let chars = s.map{ $0 }
        var maxLen = 1
        var begin = 0
        for j in 1..<s.count {
            for i in 0..<j {
                if chars[i] != chars[j] {
                    dp[i][j] = false
                } else {
                    if j - i < 3 {
                        dp[i][j] = true
                    } else {
                        dp[i][j] = dp[i+1][j-1]
                    }
                }
                
                if dp[i][j] && j - i + 1 > maxLen {
                    maxLen = j - i + 1
                    begin = i
                }
            }
        }

        var res = ""
        for i in begin..<begin+maxLen {
            res += String(chars[i])
        }
        
        return res
    }
}

extension DynamicAlgorithm {
    /**
     题目：最长递增子序列
     */
    static func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp: [Int] = .init(repeating: 1, count: nums.count)
        var len = 1
        for i in 1..<nums.count {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            
            len = max(dp[i], len)
        }
        
        return len
    }
}
