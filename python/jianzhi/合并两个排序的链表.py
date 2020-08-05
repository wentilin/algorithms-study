"""
题目描述
输入两个单调递增的链表，输出两个链表合成后的链表，当然我们需要合成后的链表满足单调不减规则。
"""


# -*- coding:utf-8 -*-
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None


class Solution:
    # 方法: 归并排序合并
    # time: O(n)
    # space: O(n)
    def Merge(self, pHead1, pHead2):
        if not pHead1:
            return pHead2
        if not pHead2:
            return pHead1

        i = pHead1
        j = pHead2
        dummy = ListNode(1)
        cur = dummy

        while i and j:
            if i.val <= j.val:
                cur.next = i
                i = i.next

            elif i.val > j.val:
                cur.next = j
                j = j.next

            cur = cur.next

        if i:
            cur.next = i

        if j:
            cur.next = j

        return dummy.next


if __name__ == '__main__':
    a1 = ListNode(1)
    a1.next = ListNode(3)
    a1.next.next = ListNode(5)

    a2 = ListNode(1)
    a2.next = ListNode(3)
    a2.next.next = ListNode(5)

    test = Solution().Merge(a1, a2)
    print()