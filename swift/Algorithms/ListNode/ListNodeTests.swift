//
//  ListNodeTests.swift
//  Algorithms
//
//  Created by wentilin on 2020/5/16.
//  Copyright © 2020 wentilin. All rights reserved.
//

import Foundation

class ListNodeTests {
    static func startTest() {
        testFindKthNodeToTail()
        
        testReverseNode()
        
        testMerge()
    }
}

extension ListNodeTests {
    static func testFindKthNodeToTail() {
        let list = _buildList(from: [1, 2, 3, 4, 5])
        print("Kth node to tail: \(ListNodeAlgorithm.findKthNodeToTail(head: list, kthToTail: 3))")
    }
    
    static func testReverseNode() {
        let list = _buildList(from: [1, 2, 3, 4, 5])
        print("reverseNode: \(ListNodeAlgorithm.reverseNode(list))")
    }
    
    static func testMerge() {
        let list1 = _buildList(from: [1, 2, 3, 4, 5])
        let list2 = _buildList(from: [1, 2, 3, 4, 5])
        
        print("merge two list node: \(ListNodeAlgorithm.merge(list1: list1, list2: list2))")
    }
    
    private static func _buildList(from array: [Int]) -> ListNode? {
        guard array.count > 0 else { return nil }
        
        let head: ListNode = .init(val: 0)
        var current: ListNode? = head
        for item in array {
            current?.next = .init(val: item)
            current = current?.next
        }
        
        return head.next
    }
}

extension ListNodeTests {
    static func testCloneRandomListNode() {
        let a = RandomListNode("a")
        let b = RandomListNode("b")
        let c = RandomListNode("c")
        let d = RandomListNode("d")
        let e = RandomListNode("e")
        a.next = b
        a.random = c
        
        b.next = c
        b.random = e
        
        c.next = d
        
        d.next = e
        d.random = b
        
        let cloneNode = ListNodeAlgorithm.clone(a)
        print(cloneNode)
    }
}

extension ListNodeTests {
    static func testDeleteDuplicateNodeInSortedLinkedList() {
        let list = _buildList(from: [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6])
        print(ListNodeAlgorithm.deleteDuplicateNodeInSortedLinkedList(list))
    }
}
