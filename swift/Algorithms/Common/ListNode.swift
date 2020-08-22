//
//  ListNode.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/16.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class ListNode: NSObject {
    var val: Int
    var next: ListNode?
    
    init(val: Int, next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

class DeListNode: NSObject {
    var val: Int
    var next: DeListNode?
    var previous: DeListNode?
    
    init(val: Int, next: DeListNode? = nil, previous: DeListNode? = nil) {
        self.val = val
        self.next = next
        self.previous = previous
    }
}

extension ListNode {
    override var description: String {
        var des: String = "\(val)"
        var next = self.next
        while next != nil {
            des = des + ">\(next!.val)"
            next = next?.next
        }
        
        return des
    }
}

class RandomListNode: NSObject {
    var label: String
    var next: RandomListNode?
    var random: RandomListNode?
    
    init(_ label: String, next: RandomListNode? = nil, random: RandomListNode? = nil) {
        self.label = label
        self.next = next
        self.random = random
    }
}
