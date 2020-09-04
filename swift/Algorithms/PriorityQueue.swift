//
//  PriorityQueue.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/30.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class PriorityQueue: CustomStringConvertible {
    private var _heap: [Int] = []
    var count: Int {
        return _heap.count - 1
    }
    
    var isEmpty: Bool {
        return count < 1
    }
    
    init() {
        _heap.append(-1)
    }
    
    func push(_ value: Int) {
        if count == 1 {
            _heap.append(value)
            return
        }
        
        _heap.append(value)
        var i = count
        while i >= 1 {
            // If value is less than it's parent, move up and swap.
            if _heap[i] < _heap[i/2] {
                _swap(index: i, with: i/2)
            } else {
                break
            }
            
            i = i/2
        }
    }
    
    func pop() -> Int {
        assert(count >= 1, "Pop a empty queue is illegal.")
        
        let first = _heap[1]
        let last = _heap.removeLast()
        if count == 0 {
            return first
        }
        
        _heap[1] = last
        
        var i = 1
        while 2 * i < count {
            let leftChild = 2 * i
            let rightChild = 2 * i + 1
            
            // Don't have right child
            if rightChild > count {
                if _heap[i] < _heap[leftChild] {
                    _swap(index: i, with: leftChild)
                }
                break
            }
            
            if _heap[i] <= _heap[leftChild] && _heap[i] <= _heap[rightChild] {
                break
            }
            
            if _heap[leftChild] <= _heap[rightChild] {
                _swap(index: i, with: leftChild)
                i = leftChild
            } else {
                _swap(index: i, with: rightChild)
                i = rightChild
            }
        }
        
        return first
    }
    
    private func _swap(index: Int, with toIndex: Int) {
        (_heap[index], _heap[toIndex]) = (_heap[toIndex], _heap[index])
    }
    
    var description: String {
        return "PriorityQueue\(_heap[1..<(count+1)])"
    }
}
