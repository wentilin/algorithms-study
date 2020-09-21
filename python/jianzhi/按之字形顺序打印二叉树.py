"""
请实现一个函数按照之字形打印二叉树，即第一行按照从左到右的顺序打印，第二层按照从右至左的顺序打印，
第三行按照从左到右的顺序打印，其他行以此类推。
"""

# 1
# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    # 方法: 用i记录行数奇偶
    # time: O(n)
    # space: O(n)
    def Print(self, pRoot):
        res = []
        if not pRoot:
            return res
        i = 1
        level = [pRoot]
        while len(level) > 0:
            tmp = []
            level_val = []
            for node in level:
                if node.left:
                    tmp.append(node.left)
                if node.right:
                    tmp.append(node.right)

            if i % 2 == 0:
                level = level[::-1]
            for node in level:
                level_val.append(node.val)
            res.append(level_val)

            i += 1
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
