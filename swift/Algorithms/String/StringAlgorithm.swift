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

extension StringAlgorithm {
    /**
     题目：把字符串转化成整数
     描述：将一个字符串转换成一个整数，要求不能使用字符串转换整数的库函数。 数值为0或者字符串不是一个合法的数值则返回0
          输入描述:
            输入一个字符串,包括数字字母符号,可以为空
          输出描述:
            如果是合法的数值表达则返回该数字，否则返回nil
          示例1
          输入： +2147483647 1a33
          输出：2147483647 nil
     解法：字符0~9对应ASCII码48~57，字符减去对应的ASCII码即可还原成整数
     */
    static func stringToInt(str: String) -> Int? {
        let chars: [Character] = str.map{ $0 }
        if (chars.count == 0) {
            return nil
        }

        var res: Int = 0
        var i = chars.count - 1
        while i >= 0 {
            if i == 0 && (chars[i] == "-" || chars[i] == "+") {
                if (chars[i] == "-") {
                    return res * (-1)
                } else {
                    return res
                }
            }
            let value = chars[i].unicodeScalars.first!.value - 48
            if (value < 0 || value > 9) {
                return nil
            }
            let digit = Int(pow(10, Double(chars.count - 1 - i)))
            res +=  (digit * Int(value))
            
            i -= 1
        }

        return res
    }
}

class MachineState: NSObject {
    let isAccepted: Bool
    private var transfers: [Character: MachineState] = [:]
    
    private var digitState: MachineState?
    
    init(isAccepted: Bool) {
        self.isAccepted = isAccepted
    }
    
    func transfer(with char: Character, to machineState: MachineState) {
        transfers[char] = machineState
    }
    
    func transferDigit(to machineState: MachineState) {
        digitState = machineState
    }
    
    func transfer(with char: Character) -> MachineState? {
        if let _ = Int(String(char)) {
            return digitState
        }
        
        return transfers[char]
    }
}

extension StringAlgorithm {
    /**
     题目：表示数值的字符串
     描述：请实现一个函数用来判断字符串是否表示数值（包括整数和小数）。例如，字符串"+100","5e2","-123",
          "3.1416"和"-1E-16"都表示数值。 但是"12e","1a3.14","1.2.3","+-5"和"12e+4.3"都不是。
     解法：构建确定有限状态机DFA
     */
    static func isNumeric(of string: String) -> Bool {
        var machineState: MachineState? = _buildStateMachine()
        
        for ch in string {
            machineState = machineState?.transfer(with: ch)
            if machineState == nil {
                return false
            }
        }
        
        return machineState!.isAccepted
    }
    
    static func _buildStateMachine() -> MachineState {
        let start = MachineState(isAccepted: false)
        
        let state1 = MachineState(isAccepted: false)
        let state3 = MachineState(isAccepted: true)
        
        start.transfer(with: "+", to: state1)
        start.transfer(with: "-", to: state1)
        start.transferDigit(to: state3)
        state3.transferDigit(to: state3)
        
        let state2 = MachineState(isAccepted: false)
        start.transfer(with: ".", to: state2)
        state1.transfer(with: ".", to: state2)
        
        let state4 = MachineState(isAccepted: true)
        state1.transferDigit(to: state4)
        state2.transferDigit(to: state4)
        
        state4.transferDigit(to: state4)
        
        let state5 = MachineState(isAccepted: false)
        state4.transfer(with: "e", to: state5)
        state4.transfer(with: "E", to: state5)
        state3.transfer(with: "e", to: state5)
        state3.transfer(with: "E", to: state5)
        
        let state6 = MachineState(isAccepted: true)
        state5.transferDigit(to: state6)
        state6.transferDigit(to: state6)
        
        let state7 = MachineState(isAccepted: false)
        state5.transfer(with: "+", to: state7)
        state5.transfer(with: "-", to: state7)
        
        let state8 = MachineState(isAccepted: true)
        state7.transferDigit(to: state8)
        state8.transferDigit(to: state8)
        
        let state9 = MachineState(isAccepted: false)
        state4.transfer(with: ".", to: state9)
        state3.transfer(with: ".", to: state9)
        
        let state10 = MachineState(isAccepted: true)
        state9.transferDigit(to: state10)
        state10.transferDigit(to: state10)
        state10.transfer(with: "e", to: state5)
        state10.transfer(with: "E", to: state5)
        
        return start
    }
}
