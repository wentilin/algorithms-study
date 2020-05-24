//
//  StackAlgorithm.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/24.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class StackAlgorithm {
    static func testMinStack() {
        let minStack = MinStack()
        for value in [5, 8, 3, 6, 4, 1] {
           minStack.push(value)
        }
        
        print("----------------min stack start test---------------")
        print(minStack)
        var value = minStack.pop()
        while value != nil {
            print("pop(\(value!))")
            
            if !minStack.isEmpty {
                print("after pop: \(minStack)")
            }
            
            value = minStack.pop()
        }
        print("----------------min stack end test---------------")
    }
}
