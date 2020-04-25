//
//  RectRecover.swift
//  Algorithms
//
//  Created by wentilin on 2020/4/25.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

/**
 *  问题：我们可以用2*1的小矩形横着或者竖着去覆盖更大的矩形。
 *       请问用n个2*1的小矩形无重叠地覆盖一个2*n的大矩形，总共有多少种方法？
 *  思路：target = 0时0种，target=1时1种，target=2时2种
 *       target = n时，分两种摆法
 *       1：竖着摆一块后，有f(target - 1)
 *       2：横着摆一块后固定了只能上下摆一块，有f(target - 2)
 */
func rectCoverCount(for target: Int) -> Int {
    if target <= 2 {
        return target
    } else {
        return rectCoverCount(for: target - 1) + rectCoverCount(for: target - 2)
    }
}
