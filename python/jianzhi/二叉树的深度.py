# -*- coding:utf-8 -*-
"""题目描述
输入一棵二叉树，求该树的深度。
从根结点到叶结点依次经过的结点（含根、叶结点）形成树的一条路径，最长路径的长度为树的深度。"""


class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    # 二叉树 递归
    # time: O(n) [T(n)=2*T(n/2)]
    # space: O(n) [最坏时树为链表, 最好O(logn)]
    # 递归算法的空间复杂度=递归深度*每次递归所要的辅助空间
    def TreeDepth(self, pRoot):
        if not pRoot:
            return 0

        # 可以省略
        # if not pRoot.left and not pRoot.right:
        #     return 1

        else:
            return max(self.TreeDepth(pRoot.left), self.TreeDepth(pRoot.right)) + 1


if __name__ == '__main__':
    assert Solution().TreeDepth(None) == 0

    r = TreeNode(1)
    c21 = TreeNode(21)
    c22 = TreeNode(22)
    assert Solution().TreeDepth(r) == 1

    r.left = c21
    r.right = c22
    assert Solution().TreeDepth(r) == 2

    r.left.left = TreeNode(31)
    r.left.left.left = TreeNode(41)
    assert Solution().TreeDepth(r) == 4