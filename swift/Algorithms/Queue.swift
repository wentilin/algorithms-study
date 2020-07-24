//
//  Queue.swift
//  Algorithms
//
//  Created by linwenhu on 2020/4/20.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

struct Queue<Element> {
    var _stack1: [Element] = []
    var _stack2: [Element] = []
    
    var count: Int {
        return _stack1.count + _stack2.count
    }
    
    var isEmpty: Bool {
        return count == 0
    }
    
    mutating func push(_ item: Element) {
        _stack1.append(item)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        if _stack1.isEmpty, _stack2.isEmpty {
            return nil
        }
        
        if !_stack2.isEmpty {
            return _stack2.removeLast()
        }
        
        while !_stack1.isEmpty {
            _stack2.append(_stack1.removeLast())
        }
        
        return _stack2.removeLast()
    }
}
