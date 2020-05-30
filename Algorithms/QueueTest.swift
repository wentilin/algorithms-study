//
//  QueueTest.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/30.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class QueueTest {
    static func testPriorityQueue() {
        let queue = PriorityQueue()
        for i in [2, 2, 5, 4, 6, 4, 1, 3] {
            queue.push(i)
            print("After push(\(i)):\(queue)")
        }
        
        while !queue.isEmpty {
            let value = queue.pop()
            print("After pop(\(value):\(queue)")
        }
    }
}
