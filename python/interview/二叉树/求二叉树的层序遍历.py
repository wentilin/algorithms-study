"""
给定一个二叉树，返回该二叉树层序遍历的结果，（从左到右，一层一层地遍历）
例如：

示例1：
输入：
{1,2}
输出：
[[1],[2]]

示例2：
输入
{1,2,3,4,#,#,5}
输出
[[1],[2,3],[4,5]]
"""

# 1


class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    def levelOrder(self, root):
        res = []
        if not root:
            return res

        queue = [root]
        while len(queue):
            level = []
            next_level = []
            for node in queue:
                level.append(node)
                if node.left:
                    next_level.append(node.left)
                if node.right:
                    next_level.append(node.right)
            res.append([n.val for n in level])  # 注意要保存的是节点的值
            queue = next_level
        return res










