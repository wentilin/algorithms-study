"""
题目描述
给定一个链表，删除链表的倒数第n个节点并返回链表的头指针

例如，
 给出的链表为:1->2->3->4->5, n= 2.
 删除了链表的倒数第n个节点之后,链表变为1->2->3->5.

备注：
题目保证n一定是有效的
请给出请给出时间复杂度为O(n)的算法

示例1
输入
{1,2},2

输出
{2}

https://www.nowcoder.com/practice/f95dcdafbde44b22a6d741baf71653f6?tpId=190&&tqId=35195&rp=1&ru=/activity/oj&qru=/ta/job-code-high-rd/question-ranking
"""


class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

# @param head ListNode类
# @param n int整型
# @return ListNode类


class Solution:
    # 方法: 双指针一次遍历, slow从dummy出发，最终停留在"删除节点"的上一个节点，故两个快慢指针相差n+1
    # time: O(n)
    # space: O(1)
    def removeNthFromEnd(self, head, n):
        dummy = ListNode(0)
        dummy.next = head
        fast, slow = head, dummy
        f_step = 0
        while fast:
            f_step += 1
            if f_step > n:
                slow = slow.next
            fast = fast.next
        slow.next = slow.next.next
        return dummy.next


def print_List(ll):
    s = ""
    while ll:
        s += (str(ll.val) + "->")
        ll = ll.next
    print(s)


if __name__ == '__main__':
    a = ListNode(1)
    a.next = ListNode(2)
    a.next.next = ListNode(3)
    a.next.next.next = ListNode(4)
    print_List(Solution().removeNthFromEnd(a, 1))
