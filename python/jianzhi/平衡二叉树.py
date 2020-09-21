"""
题目描述
输入一棵二叉树，判断该二叉树是否是平衡二叉树。

在这里，我们只需要考虑其平衡性，不需要考虑其是不是排序二叉树
"""
# 1

# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution1:
    # 方法: 实质为树的深度问题，不存储树的depth，存在重复计算
    # depth time: O(n)[T(n)=O(1)+2T(n/2)]或者[T(n)=O(1)+T(n-1)]
    # time: O(nlogn)[T(n)=O(n)+2T(n/2)]->O(n^2)[T(n)=O(n)+T(n-1)]
    # space: O(n)
    def depth(self, pRoot):
        if not pRoot:
            return 0

        return 1 + max(self.depth(pRoot.left), self.depth(pRoot.right))

    def IsBalanced_Solution(self, pRoot):
        # write code here
        if not pRoot:
            return True

        if abs(self.depth(pRoot.left) - self.depth(pRoot.right)) < 2 \
                and self.IsBalanced_Solution(pRoot.left) \
                and self.IsBalanced_Solution(pRoot.right):
            return True

        return False


class Solution2:
    # 方法: 实质为树的深度问题，边求深度边判断
    # time: O(n)[T(n)=O(1)+2T(n/2)]或者O(n)[T(n)=O(1)+T(n-1)]
    # time: O(n)
    # space: O(n)
    def isBalancedHelper(self, root: TreeNode) -> (bool, int):
        # An empty tree is balanced and has height -1
        if not root:
            return True, -1

        # Check subtrees to see if they are balanced.
        leftIsBalanced, leftHeight = self.isBalancedHelper(root.left)
        if not leftIsBalanced:
            return False, 0
        rightIsBalanced, rightHeight = self.isBalancedHelper(root.right)
        if not rightIsBalanced:
            return False, 0

        # If the subtrees are balanced, check if the current tree is balanced
        # using their height
        return (abs(leftHeight - rightHeight) < 2), 1 + max(leftHeight, rightHeight)

    def IsBalanced_Solution(self, pRoot):
        return self.isBalancedHelper(pRoot)[0]



if __name__ == '__main__':
    r = TreeNode(1)
    c21 = TreeNode(2)
    c22 = TreeNode(3)

    r.left = c21
    r.right = c22
    # r.left.left = TreeNode(3)
    # r.left.left.left = TreeNode(4)
    # r.left.right = TreeNode(4)
    # r.right.left = TreeNode(4)
    # r.right.right = TreeNode(3)

    print(Solution2().IsBalanced_Solution(r))


