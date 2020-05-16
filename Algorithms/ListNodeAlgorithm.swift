//
//  ListNodeAlgorithm.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/16.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class ListNodeAlgorithm {
    /**
     * 输入一个链表，输出该链表中倒数第k个结点。
     */
    static func findKthNodeToTail(head: ListNode?, kthToTail k: Int) -> ListNode? {
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
    
    /**
     * 反转链表
     */
    static func reverseNode(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return nil
        }
        
        var pre = head
        var next = head?.next
        pre?.next = nil
        
        while next != nil {
            let tmp = next
            next = next?.next
            tmp?.next = pre
            pre = tmp
        }
        
        return pre
    }
}
