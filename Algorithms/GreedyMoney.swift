//
//  GreedyMoney.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/1.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

struct MoneyMap {
    let kind: Int
    let count: Int
}

extension MoneyMap: CustomStringConvertible {
    var description: String {
        return "\(kind)-\(count)"
    }
}

// 小明手中有 1，5，10，50，100 五种面额的纸币，每种纸币对应张数分别为 5，2，2，3，5 张。
// 若小明需要支付 456 元，则需要多少张纸币？
// 思路：贪心算法，优先选择面额最大的，接近最优
class GreedyMoney {
    static func solve(money: Int, moneyMaps: [MoneyMap]) -> [MoneyMap] {
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
