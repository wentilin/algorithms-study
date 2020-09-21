"""
题目描述
求给定二叉树的最大深度，
最大深度是指树的根结点到最远叶子结点的最长路径上结点的数量。

示例1
输入：
{1,2}
输出：
2

示例2
输入：
{1,2,3,4,#,#,5}
输出：
3
"""

class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    def maxDepth(self, root):
        if not root:
            return 0

        return max(self.maxDepth(root.left), self.maxDepth(root.right)) + 1