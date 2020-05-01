//
//  main.swift
//  Algorithms
//
//  Created by wentilin on 2020/4/4.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

let cache = LRUCache(2)

print(cache.get(2))
print(cache.get(2))

cache.put(2, 6)
print(cache.get(1))
cache.put(1, 5)
cache.put(1, 2)
print(cache.get(1))
print(cache.get(2))

print(cache)


print("---------------------------------")
var arr: [[Int]] = []

for i in 0..<4 {
    arr.append([])
    for j in i..<(i+7) {
        arr[i].append(j)
    }
}

print(arr)

print(search_nxm(arr, number: 4))
print(indexOfArryNxM(arr, target: 4))
print(minNumberInRotateArray([3, 4, 2, 3]))

let moneyMaps: [MoneyMap] = [.init(kind: 1, count: 5),
                             .init(kind: 5, count: 2),
                             .init(kind: 10, count: 2),
                             .init(kind: 50, count: 3),
                             .init(kind: 100, count: 5)]
print(GreedyMoney.solve(money: 456, moneyMaps: moneyMaps))
