# -*- coding:utf-8 -*-
from collections import deque

"""
题目描述
操作给定的二叉树，将其变换为源二叉树的镜像。

二叉树的镜像定义：
源二叉树：
    	    8
    	   /  \
    	  6   10
    	 / \  / \
    	5  7 9 11

镜像二叉树：
    	    8
    	   /  \
    	  10   6
    	 / \  / \
    	11 9 7  5
"""


class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


def print_tree_level(root):
    mirror = Solution().Mirror(root)

    if not mirror:
        print('mirror is none')
        return

    q = deque([mirror])
    result = ''

    while len(q) > 0:
        top = q.popleft()
        result += (str(top.val) + ",")

        if top.left:
            q.append(top.left)

        if top.right:
            q.append(top.right)

    print(result)


class Solution:
    # 返回镜像树的根节点
    def Mirror(self, root):
        if not root:
            return root

        if not root.left and not root.right:
            return root

        m_root = root
        left_tmp = m_root.left
        m_root.left = self.Mirror(m_root.right)
        m_root.right = self.Mirror(left_tmp)

        return m_root


if __name__ == '__main__':
    print_tree_level(None)

    r = TreeNode(1)
    c21 = TreeNode(21)
    c22 = TreeNode(22)

    r.left = c21
    r.right = c22
    r.left.left = TreeNode(31)
    r.left.left.left = TreeNode(41)
    print_tree_level(r)
