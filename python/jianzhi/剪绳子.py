"""
题目描述
给你一根长度为n的绳子，请把绳子剪成整数长的m段（m、n都是整数，n>1并且m>1，m<=n），
每段绳子的长度记为k[1],...,k[m]。请问k[1]x...xk[m]可能的最大乘积是多少？
例如，当绳子的长度是8时，
我们把它剪成长度分别为2、3、3的三段，此时得到的最大乘积是18。
"""


# -*- coding:utf-8 -*-
class Solution:
    def cutRope(self, number):
        max = 0
        for i in range(2, number):
            ave = int(number / i)
            mod = number % i
            prod = ((ave + 1) ** mod) * (ave ** (i - mod))
            max = prod if prod > max else max
        return max


if __name__ == '__main__':
    print(Solution().cutRope(8))


"""
题目描述
输入一颗二叉树的根节点和一个整数，按字典序打印出二叉树中结点值的和为输入整数的所有路径。
路径定义为从树的根结点开始往下一直到叶结点所经过的结点形成一条路径。

返回二维列表，内部每个列表表示找到的路径
"""


# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    # 方法: 递归 回溯法，res表示结果, path表示到达当前点的时候走过的路径
    # time: O(n)，每个节点要遍历一次
    # space: O(n), 最差情况下，即树退化为链表时，path存储所有树节点
    def FindPath(self, root, expectNumber):

        def dfs(root, expectNumber, res, path):
            path.append(root.val)

            if not root.left and not root.right:
                if root.val == expectNumber:
                    res.append(path)
            if root.left:
                dfs(root.left, expectNumber - path[-1], res, path)
            if root.right:
                dfs(root.right, expectNumber - path[-1], res, path)

        res = []
        if not root:
            return res
        dfs(root, expectNumber, res, [])
        return res



if __name__ == '__main__':
    a = TreeNode(1)
    a11 = TreeNode(2)
    a12 = TreeNode(2)
    a21 = TreeNode(3)
    a22 = TreeNode(4)
    a23 = TreeNode(4)
    a24 = TreeNode(3)

    a.left = a11
    a.right = a12

    a11.left = a21
    a11.right = a22

    a12.left = a23
    a12.right = a24

    test = Solution().FindPath(a,6)
    print(test)
