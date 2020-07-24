//
//  JumpFloor.swift
//  Algorithms
//
//  Created by wentilin on 2020/4/25.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

/**
 * 问题：一只青蛙一次可以跳上1级台阶，也可以跳上2级。
 *      求该青蛙跳上一个n级的台阶总共有多少种跳法
 *
 * 思路：第n阶 = 第n-1阶 + 第n-2阶
 */
func jumpFloor(_ target: Int) -> Int {
    if target < 3 {
        return target
    }
    
    return jumpFloor(target - 1) + jumpFloor(target - 2)
}
