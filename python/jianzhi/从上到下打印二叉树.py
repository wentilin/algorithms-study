# -*- coding:utf-8 -*-
"""
题目描述
从上往下打印出二叉树的每个节点，同层节点从左至右打印。
"""

class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    # 队列 二叉树
    # time: O(n)  每个点要遍历一遍
    # space: O(n) 队列需要存每个点
    def PrintFromTopToBottom(self, root):
        res = []

        if not root:
            return res

        from collections import deque
        q = deque([root])

        while len(q) > 0:
            level = []
            while len(q) > 0:
                level.append(q.popleft())
            for n in level:
                res.append(n.val)
                if n.left:
                    q.append(n.left)
                if n.right:
                    q.append(n.right)

        return res


if __name__ == '__main__':

    print(Solution().PrintFromTopToBottom(None))

    r = TreeNode(1)
    c21 = TreeNode(21)
    c22 = TreeNode(22)

    r.left = c21
    r.right = c22
    r.left.left = TreeNode(31)
    r.left.right = TreeNode(32)
    r.left.left.left = TreeNode(41)
    print(Solution().PrintFromTopToBottom(r))


