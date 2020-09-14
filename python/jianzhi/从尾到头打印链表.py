"""
题目描述
输入一个链表，按链表从尾到头的顺序返回一个ArrayList。
"""

# 1

# -*- coding:utf-8 -*-
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None


class Solution:
    # 方法: 递归
    # time: O(n)
    # space: O(n)
    def printListFromTailToHead(self, listNode):
        store = []
        if not listNode:
            return store
        store += self.printListFromTailToHead(listNode.next)
        store.append(listNode.val)
        return store


if __name__ == '__main__':
    a1 = ListNode(1)
    a1.next = ListNode(3)
    a1.next.next = ListNode(5)

    print(Solution().printListFromTailToHead(a1))