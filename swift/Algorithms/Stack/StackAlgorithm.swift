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

extension StackAlgorithm {
    /*
     输入两个整数序列，第一个序列表示栈的压入顺序，请判断第二个序列是否可能为该栈的弹出顺序。
     假设压入栈的所有数字均不相等。例如序列1,2,3,4,5是某栈的压入顺序，序列4,5,3,2,1是该
     压栈序列对应的一个弹出序列，但4,3,5,1,2就不可能是该压栈序列的弹出序列。
     （注意：这两个序列的长度是相等的）
    解法：
     将入栈序列逐个入栈，将栈顶元素一直与出栈元素比较，如果相同则出栈，有不同时下一个元素入栈
     */
    static func isPopOrder(pushOrders: [Int], popOrders: [Int]) -> Bool {
        guard pushOrders.count == popOrders.count else { return false }
        
        var stack: [Int] = []
        var currentIndex = 0
        for item in pushOrders {
            stack.append(item)
            
            while let topItem = stack.last, popOrders[currentIndex] == topItem {
                stack.removeLast()
                currentIndex += 1
            }
        }
        
        return stack.isEmpty && currentIndex == pushOrders.count
    }
}
