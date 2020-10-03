"""
题目描述
给定一棵二叉搜索树，请找出其中的第k小的结点。例如， （5，3，7，2，4，6，8）中，按结点数值大小顺序第三小结点的值为4。
"""

# 1, 2

# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    # 方法: 二叉搜索树的中序遍历是排好序的数组
    # time: O(n)->[T(n)=1+2T(n/2)]
    # space: O(n)
    def inorder_traversal(self, pRoot, inorder):
        if not pRoot:
            return

        self.inorder_traversal(pRoot.left, inorder)
        inorder.append(pRoot)
        self.inorder_traversal(pRoot.right, inorder)

    def KthNode(self, pRoot, k):
        if k <= 0:
            return None
        inorder = []
        self.inorder_traversal(pRoot, inorder)
        if k > len(inorder):
            return None
        return inorder[k-1]


if __name__ == '__main__':
    sol = Solution()
    a1 = TreeNode(5)
    a21 = TreeNode(3)
    a22 = TreeNode(7)

    a1.left = a21
    a1.right = a22

    print(sol.KthNode(a1, 1))