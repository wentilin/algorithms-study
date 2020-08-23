//
//  SomeAlgorithms.swift
//  Algorithms
//
//  Created by wentilin on 2020/7/18.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class SomeAlgorithms {
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

extension SomeAlgorithms {
    /**
     问题：跳台阶
     描述：一只青蛙一次可以跳上1级台阶，也可以跳上2级。
          求该青蛙跳上一个n级的台阶总共有多少种跳法
     解法：第n阶 = 第n-1阶 + 第n-2阶
     */
    static func jumpFloor(_ target: Int) -> Int {
        if target < 3 {
            return target
        }
        
        return jumpFloor(target - 1) + jumpFloor(target - 2)
    }
}

struct MoneyMap {
    let kind: Int
    let count: Int
}

extension MoneyMap: CustomStringConvertible {
    var description: String {
        return "\(kind)-\(count)"
    }
}

extension SomeAlgorithms {
    /**
     描述：小明手中有 1，5，10，50，100 五种面额的纸币，每种纸币对应张数分别为 5，2，2，3，5 张。
          若小明需要支付 456 元，则需要多少张纸币？
     解法：贪心算法，优先选择面额最大的，接近最优
     */
    static func greedyMoney(money: Int, moneyMaps: [MoneyMap]) -> [MoneyMap] {
        let maps = moneyMaps.sorted { (map1, map2) -> Bool in
            map1.kind > map2.kind
        }
        
        var result: [MoneyMap] = []
        var remained = money
        for moneyMap in maps {
            if remained <= 0 {
                break
            }
            
            let count = min(remained / moneyMap.kind, moneyMap.count)
            if count > 0 {
                remained = remained - count * moneyMap.kind
                result.append(.init(kind: moneyMap.kind, count: count))
            }
        }
        
        return result
    }
}

extension SomeAlgorithms {
    /**
     题目：矩形覆盖
     描述：我们可以用2*1的小矩形横着或者竖着去覆盖更大的矩形。
          请问用n个2*1的小矩形无重叠地覆盖一个2*n的大矩形，总共有多少种方法？
     解法：target = 0时0种，target=1时1种，target=2时2种
          target = n时，分两种摆法
          1：竖着摆一块后，有f(target - 1)
          2：横着摆一块后固定了只能上下摆一块，有f(target - 2)
     */
    func rectCoverCount(for target: Int) -> Int {
        if target <= 2 {
            return target
        } else {
            return rectCoverCount(for: target - 1) + rectCoverCount(for: target - 2)
        }
    }
}
