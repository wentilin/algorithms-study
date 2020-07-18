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
