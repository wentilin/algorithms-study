"""
题目描述
输入一个链表，反转链表后，输出新链表的表头。
"""

# 1, 2


class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None


class Solution:
    # 方法: 遍历
    # time: O(n)
    # space: O(1)
    def ReverseList(self, pHead):
        if not pHead or not pHead.next:
            return pHead

        cur = pHead
        prev = None

        while cur:
            tmp = cur.next  # 要先把next存起来
            cur.next = prev  # 否则这一行会把原序列打乱
            prev = cur
            cur = tmp
        return prev


if __name__ == '__main__':
    a1 = ListNode(1)
    a1.next = ListNode(3)
    a1.next.next = ListNode(5)

    test = Solution().ReverseList(a1)

    while test:
        print(test.val)
        test = test.next