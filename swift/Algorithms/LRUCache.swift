//
//  LRUCache.swift
//  Algorithms
//
//  Created by wentilin on 2020/4/4.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class _DeListNode<Key: Hashable, Value> {
    var key: Key!
    var val: Value!
    var next: _DeListNode?
    var prev: _DeListNode?

    init(key: Key, val: Value) {
        self.key = key
        self.val = val
    }
    
    init() {
        
    }
}

class CacheStorage<Key: Hashable, Value> {
    var head: _DeListNode<Key, Value> = .init()
    var tail: _DeListNode<Key, Value> = .init()

    init() {
        head.next = tail
        tail.prev = head
    }

    func insert(_ node: _DeListNode<Key, Value>) {
        node.next = head.next
        head.next?.prev = node
        head.next = node
        node.prev = head
    }

    func removeTail() -> _DeListNode<Key, Value> {
        let node = tail.prev!
        remove(tail.prev!)
        return node
    }

    func remove(_ node: _DeListNode<Key, Value>) {
        node.next?.prev = node.prev
        node.prev?.next = node.next

        node.next = nil
        node.prev = nil
    }

    func moveToHead(_ node: _DeListNode<Key, Value>) {
        remove(node)
        insert(node)
    }
}

class _LRUCache<Key: Hashable, Value> {
    private let storage: CacheStorage<Key, Value> = .init()
    private var buckets: [Key: _DeListNode<Key, Value>] = [:]
    private let capacity: Int
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Key) -> Value? {
        if let node = buckets[key] {
            storage.moveToHead(node)
            return node.val
        }

        return nil
    }
    
    func put(_ key: Key, _ value: Value) {
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
