"""
题目描述
输入一颗二叉树的根节点和一个整数，按字典序打印出二叉树中结点值的和为输入整数的所有路径。
路径定义为从树的根结点开始往下一直到叶结点所经过的结点形成一条路径。

返回二维列表，内部每个列表表示找到的路径
"""

# 1

# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    # 方法: 递归 回溯法，res表示结果, path表示到达当前点的时候走过的路径
    # time: O(n)，每个节点要遍历一次
    # space: O(n), 最差情况下，即树退化为链表时，path存储所有树节点
    def FindPath(self, root, expectNumber):
        res, path = [], []

        def dfs(root, expectNumber):
            path.append(root.val)

            if not root.left and not root.right:
                if root.val == expectNumber:
                    res.append(path)
            if root.left:
                dfs(root.left, expectNumber - path[-1])
            if root.right:
                dfs(root.right, expectNumber - path[-1])

            path.pop()

        if not root:
            return res

        dfs(root, expectNumber)

        return res


if __name__ == '__main__':
    a = TreeNode(1)
    a11 = TreeNode(2)
    a12 = TreeNode(3)
    # a21 = TreeNode(3)
    # a22 = TreeNode(4)
    # a23 = TreeNode(4)
    # a24 = TreeNode(3)

    a.left = a11
    a.right = a12

    # a11.left = a21
    # a11.right = a22
    #
    # a12.left = a23
    # a12.right = a24

    test = Solution().FindPath(a, 3)
    print(test)
