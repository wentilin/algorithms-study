"""
给出两个非空的链表用来表示两个非负的整数。其中，它们各自的位数是按照逆序的方式存储的，并且它们的每个节点只能存储一位数字。

如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

示例：

输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
输出：7 -> 0 -> 8
原因：342 + 465 = 807
"""


# Definition for singly-linked list.
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None


class Solution:
    # 方法：注意整数是倒着存的，所以不用转为list
    # time: O(max(m, n))
    # space: O(max(m, n))
    def addTwoNumbers(self, l1: ListNode, l2: ListNode) -> ListNode:
        i, j = l1, l2
        carry, sum = 0, 0
        dummy = ListNode(0)
        cur = dummy

        while i or j:
            tmp = (i.val if i else 0) + (j.val if j else 0) + carry
            sum = tmp % 10
            carry = tmp // 10
            cur.next = ListNode(sum)
            cur = cur.next

            i = i.next if i else i
            j = j.next if j else j

        if carry:
            cur.next = ListNode(carry)

        return dummy.next



