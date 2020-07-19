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

extension SomeAlgorithms {
    /*
     给你一根长度为n的绳子，请把绳子剪成整数长的m段（m、n都是整数，n>1并且m>1，m<=n），
     每段绳子的长度记为k[1],...,k[m]。请问k[1]x...xk[m]可能的最大乘积是多少？
     例如，当绳子的长度是8时，我们把它剪成长度分别为2、3、3的三段，此时得到的最大乘积是18。
     解法：
        n可以划分为2~n段，每段都先贪婪的选取ceil(target_remain/n_remain)
     */
    public static func cutRope(target: Int) -> Int {
        var res = 0
        for i in 2..<target {
            var temp = 1
            var remaind = target
            for j in 0..<i {
                let cur = Int(ceilf(Float(remaind)/Float(i-j)))
                temp *= cur;
                remaind -= cur;
            }

            res = max(res, temp);
        }

        return res;
    }
}
