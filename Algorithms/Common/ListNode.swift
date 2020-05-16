//
//  ListNode.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/16.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(val: Int, next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

extension ListNode: CustomStringConvertible {
    var description: String {
        var des: String = "\(val)"
        var next = self.next
        while next != nil {
            des = des + ">\(next!.val)"
            next = next?.next
        }
        
        return des
    }
}
