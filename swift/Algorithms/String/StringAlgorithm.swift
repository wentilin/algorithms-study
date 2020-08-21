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
    描述：汇编语言中有一种移位指令叫做循环左移（ROL），现在有个简单的任务，就是用字符串模拟这个指令的运算结果。对于一个给定的字符序列S，
         请你把其循环左移K位后的序列输出。例如，字符序列S=”abcXYZdef”,要求输出循环左移3位后的结果，即“XYZdefabc”。是不是很简单？OK，搞定它！
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

extension StringAlgorithm {
    /**
     题目：字符串排列
     描述：输入一个字符串,按字典序打印出该字符串中字符的所有排列。例如输入字符串abc,则按字典序打印出由字符a,b,c
          所能排列出来的所有字符串abc,acb,bac,bca,cab和cba。
     输入描述:
            输入一个字符串,长度不超过9(可能有字符重复),字符只包括大小写字母。
     解法：先固定一个点，将后面的不断交换产生新的字符串，直到交换完最后两个
     */
    static func permutation(ofString str: String) -> [String] {
        var result: [String] = []
        var chars: [Character] = str.map{ $0 }
        if str.count > 0 {
            _permutation(of: &chars, location: 0, result: &result)
            result.sort()
        }
        
        return result
    }
    
    private static func _permutation(of chars: inout [Character], location: Int, result: inout [String]) {
        if location == chars.count - 1 {
            let str = String(chars)
            if !result.contains(str) {
                result.append(str)
            }
        } else {
            for i in location..<chars.count {
                _swap(chars: &chars, i: location, j: i)
                _permutation(of: &chars, location: location+1, result: &result)
                _swap(chars: &chars, i: location, j: i)
            }
        }
    }
    
    private static func _swap(chars: inout [Character], i: Int, j: Int) {
        (chars[i], chars[j]) = (chars[j], chars[i])
    }
}

extension StringAlgorithm {
    /**
     题目：第一个只出现一次的字符
     描述：在一个字符串(0<=字符串长度<=10000，全部由字母组成)中找到第一个只出现一次的字符,
          并返回它的位置, 如果没有则返回 -1（需要区分大小写）.（从0开始计数）
     解法：使用哈希表
     */
    static func firstNotRepeatingChar(str: String) -> Int? {
        var charMappings: [Character: Int] = [:]
        
        for char in str {
            if charMappings[char] == nil {
                charMappings[char] = 1
            } else {
                charMappings[char]! += 1
            }
        }
        
        for (index, char) in str.enumerated() {
            if charMappings[char] == 1 {
                return index
            }
        }
        
        return nil
    }
}

extension StringAlgorithm {
    /**
     题目：翻转单词顺序序列
     描述：牛客最近来了一个新员工Fish，每天早晨总是会拿着一本英文杂志，写些句子在本子上。同事Cat对Fish写的内容颇感兴趣，
          有一天他向Fish借来翻看，但却读不懂它的意思。例如，“student. a am I”。后来才意识到，这家伙原来把句子单词的顺序
          翻转了，正确的句子应该是“I am a student.”。Cat对一一的翻转这些单词顺序可不在行，你能帮助他么？
     解法：用空格分割字符串成数组，将数组翻转再拼接成字符
     */
    static func reverseSentence(str: String) -> String {
        if str.count == 0 {
            return str
        }
        var subStrings = str.split(separator: " ")
        
        if subStrings.count == 0 {
            return str
        }
        
        var lo = 0
        var hi = subStrings.count - 1
        while lo < hi {
            (subStrings[lo], subStrings[hi]) = (subStrings[hi], subStrings[lo])
            lo += 1
            hi -= 1
        }
        
        var res =  subStrings.reduce("") { $0 + $1 + " " }
        res.removeLast()
        
        return res
    }
}
