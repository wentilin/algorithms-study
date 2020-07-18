# -*- coding:utf-8 -*-
"""
题目描述
输入两棵二叉树A，B，判断B是不是A的子结构。（ps：我们约定空树不是任意一个树的子结构）
"""


class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    # 二叉树 队列遍历 + 递归检查
    # time: O(n)  每个点要遍历一遍
    # space: O(n) 
    def isSubTree(self, pRoot1, pRoot2):
        # 递归检查

        if not pRoot1 and pRoot2:
            return False

        if not pRoot2:
            return True

        if pRoot2.val != pRoot1.val:
            return False

        if pRoot2.val == pRoot1.val:
            return self.isSubTree(pRoot1.left, pRoot2.left) and self.isSubTree(pRoot1.right, pRoot2.right)

    def HasSubtree(self, pRoot1, pRoot2):
        # 队列遍历

        if not pRoot1 or not pRoot2:
            return False

        from collections import deque
        q = deque([pRoot1])

        res = False
        while not res and len(q) > 0:
            pRoot1 = q.popleft()

            if pRoot1.left:
                q.append(pRoot1.left)
            if pRoot1.right:
                q.append(pRoot1.right)

            res = self.isSubTree(pRoot1, pRoot2)
        return res


if __name__ == '__main__':

    # p1
    r = TreeNode(1)
    c21 = TreeNode(21)
    c22 = TreeNode(22)

    r.left = c21
    r.right = c22
    r.left.left = TreeNode(31)
    r.left.right = TreeNode(32)
    r.left.left.left = TreeNode(41)

    # p2
    r2 = TreeNode(1)
    c212 = TreeNode(21)
    c222 = TreeNode(22)
    r2.left = c212
    r2.right = c222
    print(Solution().HasSubtree(r, r2))
