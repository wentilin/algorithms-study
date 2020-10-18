//
//  LRUCache.swift
//  Algorithms
//
//  Created by wentilin on 2020/4/4.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class _DeListNode {
    var key: Int
    var val: Int
    var next: _DeListNode?
    var prev: _DeListNode?

    init(key: Int, val: Int) {
        self.key = key
        self.val = val
    }
}

class CacheStorage {
    var head: _DeListNode = .init(key: 0, val: 0)
    var tail: _DeListNode = .init(key: 0, val: 0)

    init() {
        head.next = tail
        tail.prev = head
    }

    func insert(_ node: _DeListNode) {
        node.next = head.next
        head.next?.prev = node
        head.next = node
        node.prev = head
    }

    func removeTail() -> _DeListNode {
        let node = tail.prev!
        remove(tail.prev!)
        return node
    }

    func remove(_ node: _DeListNode) {
        node.next?.prev = node.prev
        node.prev?.next = node.next

        node.next = nil
        node.prev = nil
    }

    func moveToHead(_ node: _DeListNode) {
        remove(node)
        insert(node)
    }
}

class _LRUCache {
    private let storage: CacheStorage = .init()
    private var buckets: [Int: _DeListNode] = [:]
    private let capacity: Int
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if let node = buckets[key] {
            storage.moveToHead(node)
            return node.val
        }

        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = buckets[key] {
            node.val = value
            storage.moveToHead(node)
        } else {
            if buckets.count == capacity {
                let node = storage.removeTail()
                buckets.removeValue(forKey: node.key)
            }
            let node = _DeListNode(key: key, val: value)
            storage.insert(node)
            buckets[key] = node
        }
    }
}
