//
//  StringAlgorithm.swift
//  Algorithms
//
//  Created by linwenhu on 2020/8/13.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class StringAlgorithm {
    /*
    题目：左旋转字符串
    描述：汇编语言中有一种移位指令叫做循环左移（ROL），现在有个简单的任务，就是用字符串模拟这个指令的运算结果。对于一个给定的字符序列S，请你把其循环左移K位后的序列输出。例如，字符序列S=”abcXYZdef”,要求输出循环左移3位后的结果，即“XYZdefabc”。是不是很简单？OK，搞定它！
    解法：字符串str可分为子字符串X(0~n-1)和Y(n~end)，leftRotate(str, n) = rotate(rotate(X)+rotate(Y))
    */
    static func leftRotateString(_ str: String, n: Int) -> String {
        if str.count == 0 || n % str.count == 0 {
            return str
        }
        
        let i = n % str.count
        var tmp = rotateString(str, start: 0, end: i-1)
        tmp = rotateString(tmp, start: i, end: str.count-1)
        tmp = rotateString(tmp, start: 0, end: str.count-1)
        
        return tmp
    }
    
    static func rotateString(_ str: String, start: Int, end: Int) -> String {
        var chars: [Character] = str.map{ $0 }
        
        var lo = start
        var hi = end
        while lo < hi {
            (chars[lo], chars[hi]) = (chars[hi], chars[lo])
            
            lo += 1
            hi -= 1
        }
        
        return String(chars)
    }
}
