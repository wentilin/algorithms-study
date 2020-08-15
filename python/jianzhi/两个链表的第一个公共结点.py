"""
题目描述
输入两个链表，找出它们的第一个公共结点。（注意因为传入数据是链表，
所以错误测试数据的提示是用其他方式显示的，保证传入数据是正确的）
"""


# -*- coding:utf-8 -*-
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None


class Solution:
    # 方法: len(p1)=a+c; len(p2)=b+c; 如果len(p1)+b == len(p2)+a
    # time: O(n+m)
    # space: O(1)
    def FindFirstCommonNode(self, pHead1, pHead2):
        if not pHead1 or not pHead2:
            return None

        p1, p2 = pHead1, pHead2
        while p1 != p2:
            p1 = pHead2 if not p1 else p1.next
            p2 = pHead1 if not p2 else p2.next

        return p1