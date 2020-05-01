//
//  MaxSumOfSubArray.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/1.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

/**
 * 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 *
 * 输入: [-2,1,-3,4,-1,2,1,-5,4],
 * 输出: 6
 * 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 *
 * 思路：第i处的和为sum[i] = max(sum[i-1], arr[i]) + arr[i] ==> sum[i] = max(sum[i-1], 0) + arr[i]
 */
class MaxSumOfSubArray {
    static func solve(arr: [Int]) -> Int? {
        guard arr.count > 0 else {
            return nil
        }
        
        if arr.count == 1 {
            return arr[0]
        }
        
        var tempArr: [Int] = [Int](repeating: 0, count: arr.count)
        var result = arr[0]
        for i in 1..<arr.count {
            tempArr[i] = max(tempArr[i-1], 0) + arr[i]
            result = max(result, tempArr[i])
        }
        
        return result
    }
}
