# -*- coding:utf-8 -*-
"""
题目描述
给定一个二叉树和其中的一个结点，请找出中序遍历顺序的下一个结点并且返回。
注意，树中的结点不仅包含左右子结点，同时包含指向父结点的指针。
"""

# 1, 2

class TreeLinkNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
        self.next = None


class Solution:
    # 二叉树 中序遍历的规律
    # 1. 有右孩子节点(往下找)，找到该右孩子节点的最远左孩子节点；否则返回该右孩子节点
    # 2. 没有右孩子节点(往上找)，找到当前节点的'最近祖先节点'，并满足该节点的左孩子节点也为其祖先节点
    # time: O(n)  链表时，每个点都要遍历一遍，最好为O(logn)
    # space: O(1)
    def GetNext(self, pNode):
        if not pNode:
            return pNode

        if pNode.right:
            pNode = pNode.right
            while pNode.left:
                pNode = pNode.left
            return pNode

        current = pNode
        parent = pNode.next
        while parent:
            if parent.left is current:
                return parent
            else:
                current = parent
                parent = parent.next

        return None


if __name__ == '__main__':

    r = TreeLinkNode(1)
    c21 = TreeLinkNode(21)
    c22 = TreeLinkNode(22)

    r.left = c21
    r.right = c22
    c21.next = r
    c22.next = r

    c31 = TreeLinkNode(31)
    c32 = TreeLinkNode(32)

    c21.left = c31
    c21.right = c32

    c31.next = c21
    c32.next = c21

    print(Solution().GetNext(c31).val)