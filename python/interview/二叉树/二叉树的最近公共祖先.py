"""
https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/

示例 1:

输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
输出: 3
解释: 节点 5 和节点 1 的最近公共祖先是节点 3。
示例 2:

输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
输出: 5
解释: 节点 5 和节点 4 的最近公共祖先是节点 5。因为根据定义最近公共祖先节点可以为节点本身。
 

说明:

所有节点的值都是唯一的。
p、q 为不同节点且均存在于给定的二叉树中。

"""

# 1

# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution1:
    # 方法：非递归，使用哈希表记录结点的父节点，按深度从大到小遍历p的祖先并加到visited里，再按深度从大到小遍历q的祖先，
    # 出现在visited的即为答案
    # time: O(n) 每个点都要遍历一遍
    # space: O(n)
    def lowestCommonAncestor(self, root: 'TreeNode', p: 'TreeNode', q: 'TreeNode') -> 'TreeNode':

        parent = dict()

        def dfs(head, pa_node=None):
            if not head:
                return
            parent[head] = pa_node
            dfs(head.left, head)
            dfs(head.right, head)

        dfs(root)
        visited = []
        while p:  # p也要加到visited，因为p可能是q的祖先
            visited.append(p)
            p = parent[p]

        while q:
            if q in visited:
                return q
            q = parent[q]

        # 这时q为None
        return q


class Solution2:
    # 方法：递归，每条路径dfs直到叶节点，有遇到p|q即返回该节点，没有则返回None
    # time: O(n) 每个点都要遍历一遍
    # space: O(n)
    def lowestCommonAncestor(self, root: 'TreeNode', p: 'TreeNode', q: 'TreeNode') -> 'TreeNode':
        if not root or root == q or root == p:
            return root

        left = self.lowestCommonAncestor(root.left, p, q)
        right = self.lowestCommonAncestor(root.right, p, q)

        if not left:
            return right

        if not right:
            return left

        # 最近公共祖先
        return root


if __name__ == '__main__':
    r = TreeNode(1)
    c21 = TreeNode(2)
    c22 = TreeNode(3)
    c31 = TreeNode(4)
    c32 = TreeNode(5)
    r.left = c21
    r.right = c22
    r.left.left = c31
    r.left.right = c32
    print(Solution1().lowestCommonAncestor(r, c21, c22).val)
    print(Solution1().lowestCommonAncestor(r, c21, c31).val)
    print(Solution1().lowestCommonAncestor(r, c22, c32).val)











