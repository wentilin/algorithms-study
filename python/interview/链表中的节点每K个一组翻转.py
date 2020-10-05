"""
将给出的链表中的节点每k个一组翻转，返回翻转后的链表
如果链表中的节点数不是k 的倍数，将最后剩下的节点保持原样
你不能更改节点中的值，只能更改节点本身。

要求空间复杂度O(1)

示例1
输入
{1,2,3,4,5},2

输出
{2,1,4,3,5}

示例2
输入
{1,2,3,4,5}, 3

输出
{3,2,1,4,5}
"""
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

#
#
# @param head ListNode类
# @param k int整型
# @return ListNode类
#


class Solution:
    def reverse_k(self, head, tail):
        cur = head
        prev = tail.next # 翻转后接在tail.next前面
        while prev != tail:
            tmp = cur.next
            cur.next = prev
            prev = cur
            cur = tmp
        return tail, head # 注意这里返回时，tail是头节点，head变成尾节点

    def reverseKGroup(self, head, k):
        if not head or k < 2:
            return head

        dummy = ListNode(0)
        dummy.next = head
        head_for_check = dummy

        while head:
            tail = head_for_check
            # 查看剩余部分长度是否大于等于 k
            for i in range(k):
                tail = tail.next
                if not tail:
                    return dummy.next

            nex = tail.next # 下一个翻转的起始点
            head, tail = self.reverse_k(head, tail) # head和tail分别为子链的起始和终结点

            # 把子链表重新接回原链表
            head_for_check.next = head  # 接前面
            tail.next = nex  # 接后面
            head_for_check = tail
            head = tail.next

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
    print(print_List(Solution().reverseKGroup(a, 2)))
