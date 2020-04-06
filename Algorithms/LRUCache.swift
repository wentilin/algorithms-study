//
//  LRUCache.swift
//  Algorithms
//
//  Created by wentilin on 2020/4/4.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class _DoubleLinkedNode: Equatable {
    var prev: _DoubleLinkedNode?
    var next: _DoubleLinkedNode?
    var key: Int
    var value: Int

    init(key: Int, value: Int) {
        self.key = key
        self.value = value
    }
    
    static func == (lhs: _DoubleLinkedNode, rhs: _DoubleLinkedNode) -> Bool {
        return lhs.key == rhs.key && lhs.value == rhs.value
    }
}

extension _DoubleLinkedNode: CustomStringConvertible {
    var description: String {
        return "Node<\(key):\(value)>"
    }
}

class _LinkedCache {
    private var head: _DoubleLinkedNode
    private var tail: _DoubleLinkedNode
    
    init() {
        head = .init(key: 0, value: 0)
        tail = .init(key: 0, value: 0)
        
        head.next = tail
        tail.prev = head
    }
    
    func addNode(_ node: _DoubleLinkedNode) {
        head.next?.prev = node
        
        node.next = head.next
        node.prev = head
        
        head.next = node
    }
    
    func moveNodeToHead(_ node: _DoubleLinkedNode) {
        remove(node)
        addNode(node)
    }
    
    func removeTail() -> _DoubleLinkedNode? {
        guard let node = tail.prev, node != head else { return nil }
        
        remove(node)
        
        return node
    }
    
    private func remove(_ node: _DoubleLinkedNode) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
        
        node.prev = nil
        node.next = nil
    }
}

extension _LinkedCache: CustomStringConvertible {
    var description: String {
        var items: [_DoubleLinkedNode] = []
        var next = head.next
        while let item = next, item != tail {
            items.append(item)
            next = next?.next
        }
        
        return "\(items)"
    }
}

class LRUCache {
    let capacity: Int
    
    var count: Int {
        return _count_
    }
    
    private var storage: [Int: _DoubleLinkedNode]
    
    private let linkedCache: _LinkedCache = .init()
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.storage = [:]

    }
    
    @discardableResult
    func get(_ key: Int) -> Int {
        guard let node = storage[key] else {
            return -1
        }

        linkedCache.moveNodeToHead(node)

        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if _count_ >= capacity {
            remove()
        }

        if let node = storage[key] {
            node.value = value
            linkedCache.moveNodeToHead(node)
        } else {
            let node = _DoubleLinkedNode(key: key, value: value)
            linkedCache.addNode(node)
            storage[key] = node
        }
        
        print("cache:\(linkedCache)")
        
        _count_ += 1
    }

    private func remove() {
        if let node = linkedCache.removeTail() {
            storage.removeValue(forKey: node.key)
        }
        
        _count_ -= 1;
    }
    
    private var _count_: Int = 0
}

extension LRUCache: CustomStringConvertible {
    var description: String {
        return "items:\(storage)\ncache:\(linkedCache)"
    }
}
