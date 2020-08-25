"""
题目描述
给一个链表，若其中包含环，请找出该链表的环的入口结点，否则，输出null。
"""

# -*- coding:utf-8 -*-
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    # 方法：https://leetcode-cn.com/problems/linked-list-cycle-ii/solution/huan-xing-lian-biao-ru-kou-jie-dian-si-lu-xiang-ji/
    # 子问题是判断链表是否有环(https://zhuanlan.zhihu.com/p/31401474)。
    # 这道题是设置两个快慢指针，一个每次走一步，一个每次走两步，
    # 最后快的肯定会在环里赶上慢的。此方法也可以用一个更生动的例子来形容：在一个环形跑道上，
    # 两个运动员在同一地点起跑，一个运动员速度快，一个运动员速度慢。当两人跑了一段时间，速度
    # 快的运动员必然会从速度慢的运动员身后再次追上并超过，因为跑道是环形的。
    # time: O(n)
    # space: O(1)
    def intersect(self, pHead):
        fast, slow = pHead, pHead
        while fast and fast.next:
            fast = fast.next.next
            slow = slow.next
            if fast == slow:
                return fast

        return None

    def EntryNodeOfLoop(self, pHead):
        if not pHead:
            return pHead

        intersect = self.intersect(pHead)
        if not intersect:
            return intersect

        p1, p2 = intersect, pHead
        while p1 != p2:
            p1 = p1.next
            p2 = p2.next

        return p1