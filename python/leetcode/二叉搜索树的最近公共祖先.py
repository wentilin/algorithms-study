"""
来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-search-tree

给定一个二叉搜索树, 找到该树中两个指定节点的最近公共祖先。

百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，
满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

例如，给定如下二叉搜索树:  root = [6,2,8,0,4,7,9,null,null,3,5]

    	     6
    	   /  \
    	  2   8
    	 / \  / \
    	0  4 7  9
    	  / \
         3  5

示例 1:
输出: 6
解释: 节点 2 和节点 8 的最近公共祖先是 6。

示例 2:
输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
输出: 2
解释: 节点 2 和节点 4 的最近公共祖先是 2, 因为根据定义最近公共祖先节点可以为节点本身。

说明:

所有节点的值都是唯一的。
p、q 为不同节点且均存在于给定的二叉搜索树中
"""


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    # 二叉树 递归 最低公共结点的值在p,q之间
    # time: O(n) [最坏时树为链表]
    # space: O(n) [最坏时树为链表]
    def lowestCommonAncestor(self, root: 'TreeNode', p: 'TreeNode', q: 'TreeNode') -> 'TreeNode':
        if p.val <= root.val <= q.val or q.val <= root.val <= p.val:
            return root

        if root.val < p.val and root.val < q.val:
            return self.lowestCommonAncestor(root.right, p, q)

        elif root.val > p.val and root.val > q.val:
            return self.lowestCommonAncestor(root.left, p, q)


if __name__ == '__main__':
    r = TreeNode(40)
    c21 = TreeNode(20)
    c22 = TreeNode(50)
    c31 = TreeNode(10)
    c32 = TreeNode(30)
    r.left = c21
    r.right = c22
    r.left.left = c31
    r.left.right = c32
    print(Solution().lowestCommonAncestor(r, c22, c32).val)
