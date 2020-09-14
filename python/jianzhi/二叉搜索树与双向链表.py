"""
题目描述
输入一棵二叉搜索树，将该二叉搜索树转换成一个排序的双向链表。要求不能创建任何新的结点，只能调整树中结点指针的指向。
"""

# 1

# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    # 方法: 中序遍历，用prev记录前面的节点，prev为空是链表头结点head
    # time: O(n)
    # space: O(n)
    def Convert(self, pRootOfTree):

        def dfs(root):
            if not root:
                return None

            dfs(root.left)

            if not self.prev:
                self.head = root  # 记录head用于返回
            else:
                self.prev.right = root
                root.left = self.prev

            self.prev = root

            dfs(root.right)

        if not pRootOfTree:
            return pRootOfTree
        self.prev = None
        dfs(pRootOfTree)
        # 头结点没有左节点；尾结点没有右节点
        # self.prev.right = self.head
        # self.head.left = self.prev
        return self.head


if __name__ == '__main__':

    r = TreeNode(4)
    c21 = TreeNode(2)
    c22 = TreeNode(5)
    r.left = c21
    r.right = c22
    c21.left = TreeNode(1)
    c21.left = TreeNode(3)

    head = Solution().Convert(r)

    while head:
        print(head.val)
        head = head.right
    print()
