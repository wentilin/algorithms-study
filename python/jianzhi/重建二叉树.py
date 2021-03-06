"""
题目描述
输入某二叉树的前序遍历和中序遍历的结果，
请重建出该二叉树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。
例如输入前序遍历序列{1,2,4,7,3,5,6,8}和中序遍历序列{4,7,2,1,5,3,8,6}，则重建二叉树并返回。
"""

# 1, 2

# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    # 方法: 前序找根节点，中序定位左右子树
    # time: O(nlogn)[T(n)=O(n)+2T(n/2)]->O(n^2)[T(n)=O(n)+T(n-1)]
    # space: O(n)
    def find_index(self, l, val):
        for i, v in enumerate(l):
            if v == val:
                return i

    def construct(self, pre, tin):
        if len(pre) == len(tin) == 1:
            return TreeNode(pre[0])
        root = TreeNode(pre[0])
        index = self.find_index(tin, root.val)
        if index > 0:  # 确保中序遍历有左子树
            root.left = self.construct(pre[1:(index+1)], tin[:index])
        if index < len(tin) - 1:  # 确保中序遍历有右子树
            root.right = self.construct(pre[(index+1):], tin[(index+1):])
        return root

    def reConstructBinaryTree(self, pre, tin):
        if not pre or not tin:
            return None

        return self.construct(pre, tin)


if __name__ == '__main__':
    pre = [1, 2, 4, 3]
    tin = [4, 2, 1, 3]
    test = Solution().reConstructBinaryTree(pre, tin)
    print()