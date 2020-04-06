//
//  main.swift
//  Algorithms
//
//  Created by wentilin on 2020/4/4.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

let cache = LRUCache(2)

cache.put(1, 10)
cache.put(2, 11)
cache.put(3, 12)

cache.get(2)

cache.put(4, 13)

print(cache)

