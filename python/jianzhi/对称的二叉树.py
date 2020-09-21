"""
题目描述
请实现一个函数，用来判断一棵二叉树是不是对称的。注意，如果一个二叉树同此二叉树的镜像是同样的，定义其为对称的。
"""

# 1

# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    # 方法: 递归
    # time: O(n)
    # space: O(n)
    def equal(self, left, right):
        if not left and not right:
            return True
        if not left and right:
            return False
        if not right and left:
            return False

        return left.val == right.val and \
               self.equal(left.right, right.left) and \
               self.equal(left.left, right.right)

    def isSymmetrical(self, pRoot):
        if not pRoot:
            return True

        return self.equal(pRoot.left, pRoot.right)


if __name__ == '__main__':
    r = TreeNode(1)
    c21 = TreeNode(2)
    c22 = TreeNode(2)

    r.left = c21
    r.right = c22
    r.left.left = TreeNode(3)
    r.left.right = TreeNode(4)
    r.right.left = TreeNode(4)
    r.right.right = TreeNode(3)
    # r.left.left.left = TreeNode(41)

    print(Solution().isSymmetrical(r))
