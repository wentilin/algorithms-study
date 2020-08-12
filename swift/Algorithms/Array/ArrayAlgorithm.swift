//
//  ArrayAlgorithm.swift
//  Algorithms
//
//  Created by linwenhu on 2020/8/12.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class ArrayAlgorithm {
    // 统计一个数字再升序数组中出现的次数
    // 解法：先用二分法找到该数的位置，再左右分别递减找出相同的
    static func findAppearCount(of number: Int, inSortedArray array: [Int]) -> Int {
        guard array.count > 0 else { return 0 }
        
        var lo = 0
        var hi = array.count - 1
        var mid = 0
        var index = -1
        while lo <= hi {
            mid = (hi - lo)/2 + lo
            if array[mid] == number {
                index = mid
                break
            } else if array[mid] < number {
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }
        
        if index == -1 {
            return 0
        }
        
        var appearCount = 1
        var left = index - 1
        while left >= 0, array[left] == array[index] {
            appearCount += 1
            left -= 1
        }
        
        var right = index + 1
        while right < array.count, array[right] == array[index] {
            appearCount += 1
            right += 1
        }
        
        return appearCount
    }
}

extension ArrayAlgorithm {
    /*
     的和正好是S，如果有多对数字的和等于S，输出两个数的乘积最小的。
     输出描述:
     对应每个测试案例，输出两个数，小的先输出。
     */
    static func twoNumbersWith(sum: Int, inSortedArray array: [Int]) -> (Int, Int)? {
        guard array.count > 1 else { return nil }

        var lo = 0
        var hi = array.count - 1
        var pair: (Int, Int)? = nil
        var multiRes = Int.min
        while lo < hi {
            let num = sum - array[lo]
            
            while array[hi] > num {
                hi -= 1
            }
            
            if array[hi] == num {
                let loNum = array[lo]
                let hiNum = array[hi]
                if pair == nil {
                    pair = (loNum, hiNum)
                }
                if (loNum * hiNum < multiRes) {
                    pair?.0 = lo
                    pair?.1 = hi

                    multiRes = loNum * hiNum
                }
                
                while array[lo] == array[lo+1] {
                    lo += 1
                }
                
                while array[hi] == array[hi-1] {
                    hi -= 1
                }
            }
            
            lo += 1
        }
        
        return pair
    }
    
}
