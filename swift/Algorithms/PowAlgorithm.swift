//
//  PowAlgorithm.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/5.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class PowAlgorithm {
    // 给定一个double类型的浮点数base和int类型的整数exponent。求base的exponent次方
    static func pow(base: Double, exponent: Int) -> Double {
        if base == 0 {
            return 0
        }
        
        if exponent == 0 {
            return 1
        }
        
        var res = base
        var exp = abs(exponent)
        
        while exp > 1 {
            res *= base
            exp -= 1
        }
        
        if exponent < 0 {
            res = 1.0 / res
        }
        
        return res
    }
}
