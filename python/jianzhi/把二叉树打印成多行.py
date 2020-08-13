"""
题目描述
从上到下按层打印二叉树，同一层结点从左至右输出。每一层输出一行。
"""

# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution:
    # 返回二维列表[[1,2],[4,5]]
    def Print(self, pRoot):
        res = []
        if not pRoot:
            return res

        level = [pRoot]
        while len(level) > 0:
            tmp = []
            level_val = []
            for node in level:
                level_val.append(node.val)
                if node.left:
                    tmp.append(node.left)
                if node.right:
                    tmp.append(node.right)
            res.append(level_val)
            level = tmp
        return res


if __name__ == '__main__':
    r = TreeNode(1)
    c21 = TreeNode(21)
    c22 = TreeNode(22)

    r.left = c21
    r.right = c22
    r.left.left = TreeNode(31)
    r.left.left.left = TreeNode(41)
    print(Solution().Print(r))