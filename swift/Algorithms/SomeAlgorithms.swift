//
//  SomeAlgorithms.swift
//  Algorithms
//
//  Created by wentilin on 2020/7/18.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class SomeAlgorithms {
    static func add(_ num1: Int, _ num2: Int) -> Int {
        var n1 = num1
        var n2 = num2
        while n2 != 0 {
            let sum = n1 ^ n2 // 没有进位
            let carry = (n1 & n2) << 1 // 有进位，左移是进位后
            
            (n1, n2) = (sum, carry)
        }
        
        return n1
    }
}

extension SomeAlgorithms {
    /// 一个整型数组里除了两个数字之外，其他的数字都出现了两次。
    /// 请写程序找出这两个只出现一次的数字。
    /// 解法：1. 数组中相同的数异或(^)后会抵消，最后剩下的结果是两个不同数的异或
    ///      2. 找到第一个异或为1的位，按此换分为两个数组，改位置具有相同1的分到了一组，
    ///        都为0的分到了一组，组内元素分别异或最后的结果是两个不同的数
    static func findNumsAppearOnce(numbers: [Int]) -> (Int, Int) {
        precondition(numbers.count > 1)
        
        if numbers.count == 2 {
            return (numbers[0], numbers[1])
        }
        
        let bitRes = numbers.reduce(0, { $0 ^ $1 })
        let index = _first1(by: bitRes)
        var num1: Int = 0
        var num2: Int = 0
        for num in numbers {
            if _isBit1(target: num, index: index) {
                num1 ^= num
            } else {
                num2 ^= num
            }
        }
        
        return (num1, num2)
    }
    
    private static func _first1(by number: Int) -> Int {
        var index = 0
        var res = number
        while res & 1 == 0, index < 64 {
            res >>= 1
            index += 1
        }
        
        return index
    }
    
    private static func _isBit1(target: Int, index: Int) -> Bool {
        return ((target >> index) & 1) == 1
    }
}

extension SomeAlgorithms {
    /*
    给定一个数组A[0,1,...,n-1],请构建一个数组B[0,1,...,n-1],
    其中B中的元素B[i]=A[0]*A[1]*...*A[i-1]*A[i+1]*...*A[n-1]。
    不能使用除法。（注意：规定B[0] = A[1] * A[2] * ... * A[n-1]，
    B[n-1] = A[0] * A[1] * ... * A[n-2];）
    解法：
        左边：B[i] = A[0]*A[1]*...*A[i-1]
        右边：A[i+1]*A[i+2]*...*A[n-1]
    */
    public static func multiply(A: [Int]) -> [Int] {
        var B: [Int] = Array(repeating: 0, count: A.count);
        var res = 1;
        // 左边
        for i in 0..<A.count {
            B[i] = res;
            res *= A[i];
        }
        // 右边
        res = 1;
        for i in 0..<A.count {
            B[A.count-i-1] *= res;
            res *= A[A.count-i-1];
        }

        return B;
    }
}
