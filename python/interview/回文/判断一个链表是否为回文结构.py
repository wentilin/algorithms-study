"""
题目描述
给定一个链表，请判断该链表是否为回文结构。

示例1
输入:
[1,2,2,1]
输出:
true

备注:
1 ≤ n ≤ 10^6

参考：https://labuladong.gitbook.io/algo/gao-pin-mian-shi-xi-lie/pan-duan-hui-wen-lian-biao
"""


class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None


# @param head ListNode类 the head
# @return bool布尔型


class Solution:
    # 方法1: 递归, 比较"顺序链表"和"倒序链表"是否相同
    # time: O(n)
    # space: O(n)
    def traverse(self, head):
        if not head:
            return True
        res = self.traverse(head.next)
        # 链表的后序遍历
        res = res and self.left.val == head.val
        self.left = self.left.next
        return res

    def isPail_recur(self, head):
        self.left = head
        return self.traverse(head)

    # 方法2: 后半部分反转链表
    # time: O(n)
    # space: O(1)
    def reverse(self, slow):
        prev = None
        cur = slow
        while cur:
            tmp = cur.next
            cur.next = prev
            prev = cur
            cur = tmp
        return prev

    def isPail(self, head):
        if not head:
            return True

        # 快慢指针定位中点, fast走两步, slow走一步
        # 快指针为空，偶数个点；否则为奇数个点
        fast, slow = head, head
        while fast and fast.next:
            fast = fast.next.next
            slow = slow.next

        if fast and slow.next: # slow.next主要为了解决长度为2的链表：1->2
            slow = slow.next

        # 1->2->2(slow)->1
        # 1->2->3->2(slow)->1
        # 从slow开始反转链表, 并比较left和right是否一致
        left = head
        right = self.reverse(slow)
        while right and left:
            if left.val != right.val:
                return False
            left = left.next
            right = right.next
        return True


if __name__ == '__main__':
    a = ListNode(1)
    a.next = ListNode(2)
    a.next.next = ListNode(1)
    # a.next.next.next = ListNode(1)
    print(Solution().isPail_recur(a))
    print(Solution().isPail(a))

