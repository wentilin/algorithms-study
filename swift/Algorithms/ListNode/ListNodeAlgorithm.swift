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
    
    /// 输入两个单调递增的链表，输出两个链表合成后的链表，当然我们需要合成后的链表满足单调不减规则
    static func merge(list1: ListNode?, list2: ListNode?) -> ListNode? {
        guard list1 != nil else { return list2 }
        guard list2 != nil else { return list1 }
        
        var l1: ListNode? = list1
        var l2: ListNode? = list2
        
        let head = ListNode(val: 0)
        var current: ListNode? = head
        while l1 != nil, l2 != nil {
            if l1!.val <= l2!.val {
                current?.next = l1!
                l1 = l1!.next
            } else {
                current?.next = l2
                l2 = l2!.next
            }
            
            current = current?.next
        }
        
        if l1 != nil {
            current?.next = l1
        }
        
        if l2 != nil {
            current?.next = l2
        }
        
        return head.next
    }
    
    /// 输入一个复杂链表（每个节点中有节点值，以及两个指针，一个指向下一个节点，
    /// 另一个特殊指针random指向一个随机节点），请对此链表进行深拷贝，
    /// 并返回拷贝后的头结点。（注意，输出结果中请不要返回参数中的节点引用，否则判题程序会直接返回空）
    static func clone(_ head: RandomListNode?) -> RandomListNode? {
        if head == nil { return nil }
        
        // 1. 复制每一个节点A得到A_，A-->A_，A_-->A.next
        //            |---------------------|
        //            ↓                     |
        // A -> A_ -> B -> B_ -> C -> C_ -> D -> D_ -> E -> E_
        //                       ↑
        // |_____________________|
        var currentNode: RandomListNode? = head
        while currentNode != nil {
            let cloneNode = RandomListNode(currentNode!.label)
            cloneNode.next = currentNode?.next
            currentNode?.next = cloneNode
            currentNode = cloneNode.next
        }
        
        // 2. 根据旧链表的兄弟节点，初始化新链表的兄弟节点
        // 1. 复制每一个节点A得到A_，A-->A_，A_-->A.next
        //            |---------------------|
        //            ↓    ↓----------------|----|
        // A -> A_ -> B -> B_ -> C -> C_ -> D -> D_ -> E -> E_
        //      |----------------↑----↑
        // |_____________________|
        currentNode = head
        while currentNode != nil {
            currentNode?.next?.random = currentNode?.random == nil ? nil : currentNode?.random?.next
            currentNode = currentNode?.next?.next
        }
        
        // 3. 分拆链表，拆成旧链表和新链表
        currentNode = head
        let cloneHead: RandomListNode? = head?.next
        while currentNode != nil {
            let cloneNode = currentNode?.next
            currentNode?.next = cloneNode?.next
            cloneNode?.next = cloneNode?.next == nil ? nil : cloneNode?.next?.next
            currentNode = currentNode?.next
        }
        
        return cloneHead
    }
}
