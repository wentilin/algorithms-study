//
//  FindKthNodeToTail.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/16.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

/// 输入一个链表，输出该链表中倒数第k个结点
class FindKthNodeToTail {
    static func solve(head: ListNode?, kthToTail k: Int) -> ListNode? {
        var slow: ListNode? = head
        var fast: ListNode? = head
        
        for _ in 0..<k {
            if fast == nil {
                return nil
            }
            fast = fast?.next
        }
        
        while fast != nil {
            slow = slow?.next
            fast = fast?.next
        }
        
        return slow
    }
}
