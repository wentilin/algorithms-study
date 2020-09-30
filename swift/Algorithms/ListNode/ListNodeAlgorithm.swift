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
    
    /// 递归合并两个有序链表
    static func mergeRecursive(list1: ListNode?, list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }
        
        if list1!.val <= list2!.val {
            list1?.next = mergeRecursive(list1: list1?.next, list2: list2)
            return list1
        } else {
            list2?.next = mergeRecursive(list1: list1, list2: list2?.next)
            return list2
        }
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

extension ListNodeAlgorithm {
    /// 给一个链表，若其中包含环，请找出该链表的环的入口结点，否则，输出nil。
    /// 解法：1、设置快慢指针，假如有环，他们最后一定相遇。
    ///      2、两个指针分别从链表头和相遇点继续出发，每次走一步，最后一定相遇与环入口。
    /// 证明：进入环后快指针一定可以追上慢指针，设起始点到环入口距离为a，入口到相遇点为b，
    ///      相遇点到入口为c，走了k圈后相遇，则有
    ///      快指针 = a + (b + c) * k + b，慢指针 = a + b，快指针是慢指针速度的两倍，有
    ///      2 * ( a + b) = a + (b + c) * k + b ==> a = (k - 1) * (b + c) + c
    ///      说明链表头到环入口的距离 = 相遇点到环入口的距离 + (k - 1)圈环长度
    ///      两个指针分别从链表头和相遇点出发，最后一定相遇于环入口。
    ///      --------a---------entry-----------------b
    ///                 |                         |
    ///                 c------meet--------|
    public static func entryNodeOfLoop(pHead: ListNode?) -> ListNode? {
        if (pHead == nil) {
            return nil;
        }
        
        var n1: ListNode? = pHead;
        var n2: ListNode? = pHead;
        
        // 第一次相遇
        while (n1 != nil && n2 != nil && n2?.next != nil) {
            n1 = n1?.next;
            n2 = n2?.next?.next;
            
            if (n1! == n2!) {
                break;
            }
        }
        
        if (n1 == nil || n2?.next == nil) {
            return nil;
        }
        
        // n1从头开始走
        n1 = pHead;
        while (n1! != n2!) {
            n1 = n1?.next;
            n2 = n2?.next;
        }
        
        return n1;
    }
}

extension ListNodeAlgorithm {
    /*
     每年六一儿童节,牛客都会准备一些小礼物去看望孤儿院的小朋友,今年亦是如此。HF作为牛客的资深元老,自然也准备了一些小游戏。其中,有个游戏是这样的:首先,让小朋友们围成一个大圈。然后,他随机指定一个数m,让编号为0的小朋友开始报数。每次喊到m-1的那个小朋友要出列唱首歌,然后可以在礼品箱中任意的挑选礼物,并且不再回到圈中,从他的下一个小朋友开始,继续0...m-1报数....这样下去....直到剩下最后一个小朋友,可以不用表演,并且拿到牛客名贵的“名侦探柯南”典藏版(名额有限哦!!^_^)。请你试着想下,哪个小朋友会得到这份礼品呢？(注：小朋友的编号是从0到n-1)

     如果没有小朋友，请返回-1
     解法：使用链表，收尾相接，将停留在m-1的节点移除
     */
    static func lastRemaining(n: Int, m: Int) -> Int {
        if n <= 0 || m <= 0 {
            return -1
        }
        
        var nextNode: ListNode? = .init(val: 0)
        var preNode: ListNode? = nextNode
        for i in 1..<n {
            let node = ListNode(val: i)
            preNode?.next = node
            preNode = node
        }
        
        preNode?.next = nextNode
        
        var remaining = n
        var start = 0
        while remaining > 0 {
            if start == m - 1 {
                let tmp = nextNode
                nextNode = nextNode?.next
                preNode?.next = nextNode
                tmp?.next = nil
                
                start = 0
                remaining -= 1
            }
            
            preNode = nextNode
            nextNode = nextNode?.next
            start += 1
        }
        
        return preNode?.val ?? -1
    }
}

extension ListNodeAlgorithm {
    /**
     题目：删除链表中重复的节点
     描述：在一个排序的链表中，存在重复的结点，请删除该链表中重复的结点，重复的结点不保留，返回链表头指针。
          例如，链表1->2->3->3->4->4->5 处理后为 1->2->5
     解法：使用前后双指针，后指针用于循环消除重复节点
     */
    static func deleteDuplicateNodeInSortedLinkedList(_ linkedList: ListNode?) -> ListNode? {
        if linkedList == nil {
            return nil
        }
        
        let head = ListNode(val: -1)
        head.next = linkedList
        var preNode: ListNode? = head
        var nextNode: ListNode? = linkedList
        
        while nextNode != nil {
            if nextNode!.next != nil, nextNode!.val == nextNode!.next!.val {
                while nextNode!.next != nil, nextNode!.val == nextNode!.next!.val {
                    nextNode = nextNode?.next
                }
                
                preNode?.next = nextNode?.next
                nextNode = nextNode?.next
            } else {
                preNode = preNode?.next
                nextNode = nextNode?.next
            }
        }
        
        return head.next
    }
}
