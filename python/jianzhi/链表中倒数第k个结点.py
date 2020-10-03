# -*- coding:utf-8 -*
"""
输入一个链表，输出该链表中倒数第k个结点。
"""
# 1


class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None


class Solution:
    def FindKthToTail(self, head, k):
        # 方法: 双指针，索引相差(k-1)
        # time: O(2n) = O(n)
        # space: O(1)
        if not head:
            return head

        # 边界
        if k <= 0:
            return None

        i, j = head, head
        step_j = 1  # 走完即为链表长度
        while j.next:
            step_j += 1
            j = j.next
            if step_j - 1 >= k:
                i = i.next

        # 边界: k超过链表长度
        if k > step_j:
            return None

        return i


if __name__ == '__main__':
    sol = Solution()
    l_1 = ListNode(1)
    # l_2 = ListNode(2)
    # l_3 = ListNode(3)
    # l_4 = ListNode(4)
    # l_5 = ListNode(5)
    # l_1.next = l_2
    # l_2.next = l_3
    # l_3.next = l_4
    # l_4.next = l_5
    res = sol.FindKthToTail(l_1, 1)
    print(res.val)