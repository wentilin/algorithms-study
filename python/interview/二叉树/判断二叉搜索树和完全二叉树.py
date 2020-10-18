"""
题目描述
给定一棵二叉树，已经其中没有重复值的节点，请判断该二叉树是否为搜索二叉树和完全二叉树。

示例1
输入
{2,1,3}
输出
[true,true]
"""

# 1


class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


# @param root TreeNode类 the root
# @return bool布尔型一维数组


class Solution:
    def judgeIt(self, root):

        # 中序遍历升序，递归写法
        def binary_search_tree_recur(root):
            if not root:
                return True

            if root.left:
                if root.val > root.left.val:
                    return binary_search_tree_recur(root.left)
                else:
                    return False
            if root.right:
                if root.val < root.right.val:
                    return binary_search_tree_recur(root.right)
                else:
                    return False
            return True

        # 中序遍历升序，非递归写法
        def binary_search_tree(root):
            if not root:
                return True

            stack = []
            prev = None
            while stack or root:
                while root:
                    stack.append(root)
                    root = root.left
                
                root = stack.pop()
                # 中序，pop后比较
                if prev and prev.val > root.val:
                    print(prev.val, root.val)
                    return False
                prev = root
                root = root.right

            return True
        
        # 完全二叉树(满二叉树可以缺一些index大的节点)
        def complete_binary_tree(root):
            if not root:
                return True

            level = [root]
            leaf = False
            while level:
                next_level = []
                for n in level:
                    if not n.left and n.right:
                        return False

                    if leaf:
                        if n.left or n.right:
                            return False

                    if not n.right:  # 可以有/无左孩
                        leaf = True

                    if n.left:
                        next_level.append(n.left)
                    if n.right:
                        next_level.append(n.right)
                level = next_level

            return True

        return [binary_search_tree(root), complete_binary_tree(root)]


if __name__ == '__main__':
    a1 = TreeNode(3)
    a21 = TreeNode(1)
    a22 = TreeNode(5)
    a32 = TreeNode(2)
    a33 = TreeNode(4)
    a34 = TreeNode(6)
    a1.left = a21
    a1.right = a22
    a21.right = a32
    a22.left = a33
    a22.right = a34
    print(Solution().judgeIt(a1))