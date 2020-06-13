//
//  DuplicateNumber.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/5.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class DuplicateNumber {
    /**
     * 在一个长度为n的数组里的所有数字都在0到n-1的范围内。
     * 数组中某些数字是重复的，但不知道有几个数字是重复的。也不知道每个数字重复几次。请找出数
     * 组中任意一个重复的数字。
     * 例如，如果输入长度为7的数组{2,3,1,0,2,5,3}，那么对应的输出是第一个重复的数字2。
     */
    static func duplicateNumber(at numbers: [Int]) -> Int? {
        var tmp: [Int] = [Int](repeating: 0, count: numbers.count)
        
        for i in 0..<numbers.count {
            let number = numbers[i]
            if tmp[number] > 0 {
                return number
            }
            
            tmp[number] += 1
        }
        
        return nil
    }
}
