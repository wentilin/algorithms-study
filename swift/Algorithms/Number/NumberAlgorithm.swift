//
//  NumberAlgorithm.swift
//  Algorithms
//
//  Created by wentilin on 2020/8/23.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class NumberAlgorithm {
    /**
     题目：数值的整数次方
     描述：给定一个double类型的浮点数base和int类型的整数exponent。求base的exponent次方
     解法：指数取绝对值，每次减一base相乘一次直到指数为1，若指数为负数，结果取倒数
     */
    static func pow(base: Double, exponent: Int) -> Double {
        if base == 0 {
            return 0
        }
        
        if exponent == 0 {
            return 1
        }
        
        if exponent == 1 {
            return base
        }
        
        var res = pow(base: base, exponent: abs(exponent) / 2)
        res *= res
        
        if exponent % 2 != 0 {
            res *= base
        }
        
        if exponent < 0 {
            res = 1.0 / res
        }
        
        return res
    }
}

extension NumberAlgorithm {
    /**
     题目：丑数
     描述：把只包含质因子2、3和5的数称作丑数（Ugly Number）。例如6、8都是丑数，但14不是，因为它包含质因子7。 习惯上我们把1当做是第一个丑数。
          求按从小到大的顺序的第N个丑数。
     解法：用三个队列存储分别乘以2，3，5的丑数，每次将最新的丑数分别乘以队列最大的数，并取走三个队列中最小的数成为新的丑数
     */
    static func getUglyNumber(index: Int) -> Int {
        if index < 6 {
            return index
        }
        
        var res: [Int] = [1]
        var p0 = 0
        var p1 = 0
        var p2 = 0
        var number: Int = 1
        while res.count < index {
            number = min(res[p0] * 2, res[p1] * 3, res[p2] * 5)
            res.append(number)
            if res[p0] * 2 == number {
                p0 += 1
            }
            
            if res[p1] * 3 == number {
                p1 += 1
            }
            
            if res[p2] * 5 == number {
                p2 += 1
            }
        }
        
        return number
    }
}

extension NumberAlgorithm {
    /**
     题目：二进制中1的个数
     描述：输入一个整数，输出该数32位二进制表示中1的个数，其中负数用补码表示
     解法：从右向左与1做与运算，结果为1则含有1
     */
    static func numberOf1ToBinary(n: Int) -> Int {
        var count: Int = 0
        var num = n
        if n < 0 {
            num = n & 0x7fffffff
            count = 1
        }
        while num != 0 {
            if num & 1 == 1 {
                count += 1
            }
            num = num >> 1
        }
        
        return count
    }
}

extension NumberAlgorithm {
    /**
     题目：整数中1出现的次数（从1到n整数中1出现的次数）
     描述：求出1~13的整数中1出现的次数,并算出100~1300的整数中1出现的次数？
          为此他特别数了一下1~13中包含1的数字有1、10、11、12、13因此共出现6次,
          但是对于后面问题他就没辙了。ACMer希望你们帮帮他,并把问题更加普遍化,可以
          很快的求出任意非负整数区间中1出现的次数（从1 到 n 中1出现的次数）。
     解法：N为x位数，表示为Nx Nx-1...Ni Ni-1...N1，i为当前位cur，Nx Nx-1...Ni+1为高位high，
          Ni-1...N1为低位low，
          digit为位数（如10表示十位）
          1. 当cur=0时，1的次数由高位决定：high * digit
          2. 当cur=1时，1的次数由高位和低位决定：high * digit + low + 1
          3. 当cur=2~9时，1的次数由高位决定：(high+1) * digit
     */
    static func numberOf1Between1AndN(_ n: Int) -> Int {
        var digit = 1
        var res = 0
        var high = n / 10
        var cur = n % 10
        var low = 0
        while high != 0 || cur != 0 {
            if cur == 0 {
                res += high * digit
            } else if cur == 1 {
                res += high * digit + low + 1
            } else {
                res += (high + 1) * digit
            }
            
            low += cur * digit
            cur = high % 10
            high /= 10
            digit *= 10
        }
        
        return res
    }
}

extension NumberAlgorithm {
    /**
      题目：和为S的连续正数序列
      小明很喜欢数学,有一天他在做数学作业时,要求计算出9~16的和,他马上就写出了正确答案是100。
      但是他并不满足于此,他在想究竟有多少种连续的正数序列的和为100(至少包括两个数)。
      没多久,他就得到另一组连续正数和为100的序列:18,19,20,21,22。现在把问题交给你,
      你能不能也很快的找出所有和为S的连续正数序列? Good Luck!
      输出所有和为S的连续正数序列。序列内按照从小至大的顺序，序列间按照开始数字从小到大的顺序
      解法：从1开始穷举，累加至和为sum
     */
    static func findContinuousSequence(for sum: Int) -> [[Int]]{
        guard sum > 1 else { return [] }
        
        var results: [[Int]] = []
        for i in 1..<sum {
            var sequence: [Int] = []
            sequence.append(i)
            var tmp = i
            for j in i+1..<sum {
                if sum < j+tmp {
                    break
                }
                
                tmp += j
                sequence.append(j)
            }
            
            if tmp == sum {
                results.append(sequence)
            }
        }
        
        return results
    }
}

extension NumberAlgorithm {
    /**
     题目：不用加减乘除做加法
     描述：写一个函数，求两个整数之和，要求在函数体内不得使用+、-、*、/四则运算符号。
     解法：异或运算--位相同为0不同为1，与运算：同为1为1否则为0；两个数做异或运算知道相加
          不产生进位的位，与运算是产生进位的位，将进位左移继续运算，直到第二个数为0
     */
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

extension NumberAlgorithm {
    /**
     描述：不使用临时变量交换两个整数
     解法：使用异或，a = a^b, b = a ^ b, a = a ^ b
     */
    static func swap(num1: inout Int, num2: inout Int) {
        num1 = num1 ^ num2
        num2 = num1 ^ num2
        num1 = num1 ^ num2
    }
}
