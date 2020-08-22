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



class Deque: NSObject {
    private var head: DeListNode
    private var tail: DeListNode
    
    var count: Int {
        return _count_
    }
    
    var isEmpty: Bool {
        return _count_ == 0
    }
    
    var first: Int {
        precondition(_count_ > 0)
        
        return head.next!.val
    }
    
    var last: Int {
        precondition(_count_ > 0)
        
        return tail.previous!.val
    }
    
    override init() {
        head = .init(val: 0)
        tail = .init(val: 0)
        
        head.next = tail
        tail.previous = head
    }
    
    func pushFront(value: Int) {
        let node = DeListNode(val: value)
        
        node.next = head.next
        head.next?.previous = node
        
        head.next = node
        node.previous = head
        
        _count_ += 1
    }
    
    func pushBack(value: Int) {
        let node = DeListNode(val: value)
        
        tail.previous?.next = node
        node.previous = tail.previous
        
        node.next = tail
        tail.previous = node
        
        _count_ += 1
    }
    
    @discardableResult
    func popFront() -> Int {
        precondition(_count_ > 0)
        
        let node = head.next
        node?.next?.previous = head
        head.next = node?.next
        
        node?.next = nil
        node?.previous = nil
        
        _count_ -= 1
        
        return node!.val
    }
    
    @discardableResult
    func popBack() -> Int {
        precondition(_count_ > 0)
        
        let node = tail.previous
        node?.previous?.next = tail
        tail.previous = node?.previous
        
        node?.previous = nil
        node?.next = nil
        
        _count_ -= 1
        
        return node!.val
    }
    
    private var _count_: Int = 0
}
