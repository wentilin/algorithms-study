//
//  MinStack.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/24.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

/// 可通过O(1)复杂度获取栈中最小值
class MinStack {
    private var _stack: [Int] = []
    private var _min = Int.min
    private var _top = Int.min
    
    var isEmpty: Bool {
        return _stack.isEmpty
    }
    
    var top: Int {
        assert(!_stack.isEmpty)
        return _top
    }
    
    var min: Int {
        assert(!_stack.isEmpty)
        return _min
    }
    
    func push(_ value: Int) {
        if _stack.isEmpty {
            _min = value
        }
        
        _stack.append(value - _min)
        if _min > value {
            _min = value
        }
        _top = value
    }
    
    func pop() -> Int? {
        guard let last = _stack.last else {
            return nil
        }
        
        if last < 0 {
            _min -= last
        }
        
        _stack.removeLast()
        let value = _top
        if let last = _stack.last {
            _top = _min + ( last > 0 ? last : 0)
        }
        
        return value
    }
}

extension MinStack: CustomStringConvertible {
    var description: String {
        return "Stack(top:\(top)-min:\(min))"
    }
}
