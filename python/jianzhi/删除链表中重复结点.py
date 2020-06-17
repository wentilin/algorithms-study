# -*- coding:utf-8 -*-
"""
题目描述
在一个排序的链表中，存在重复的结点，请删除该链表中重复的结点，重复的结点不保留，返回链表头指针。
例如，链表1->2->3->3->4->4->5 处理后为 1->2->5
"""


class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None


class Solution:
    # 方法: 双指针，慢指针指向最后一个不重复的位置；快指针选择重复区域
    # time: O(n)
    # space: O(1)
    def delete_duplication(self, pHead):
        # write code here
        if not pHead or not pHead.next:
            return pHead

        start = ListNode(0)
        start.next = pHead
        i, j = start, pHead
        while j and j.next:
            if j.next.val != j.val:
                i = i.next
            else:
                while j and j.next and j.next.val == j.val:
                    j = j.next
                i.next = j.next
            j = j.next

        return start.next

    def print_list(self, res):
        while res:
            print(res.val)
            res = res.next


if __name__ == '__main__':
    sol = Solution()
    l_1 = ListNode(1)
    l_2 = ListNode(1)
    l_3 = ListNode(2)
    l_4 = ListNode(2)
    # l_5 = ListNode(4)
    l_1.next = l_2
    l_2.next = l_3
    l_3.next = l_4
    # l_4.next = l_5
    res = sol.delete_duplication(l_1)
    while res:
        print(res.val)
        res = res.next