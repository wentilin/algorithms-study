# 1

# 非递归遍历，时间复杂度O(n)
# Definition for a binary tree node.
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    def pre_order(self, head):
        stack, res = [], []
        if not head:
            return res

        while stack or head:
            while head:
                stack.append(head)
                res.append(head.val)
                head = head.left

            head = stack.pop()
            head = head.right
        return res

    def in_order(self, head):
        stack, res = [], []
        if not head:
            return res

        while stack or head:
            while head:
                stack.append(head)
                head = head.left

            head = stack.pop()
            res.append(head.val)
            head = head.right
        return res

    # def post_order_1(self, head):
    #     '''
    #     后序遍历二叉树非递归 后序遍历是 左-右-中
    #     反过来就是 中-右-左 其实就是先序遍历镜像二叉树(即左右互换)
    #     :param head: 头节点
    #     :return: result[::-1] 逆序
    #     '''
    #     if not head:
    #         return []
    #     stack, result = [], []
    #     stack.append(head)
    #     while len(stack) != 0:
    #         node = stack.pop() # 先序 遇到就先输出
    #         result.append(node.val)
    #         # 先压栈左节点再压右节点 所以输出就是先右后左
    #         if node.left:
    #             stack.append(node.left)
    #         if node.right:
    #             stack.append(node.right)
    #     return result[::-1] # 将 中-右-左 逆序变为 左-右-中

    def post_order(self, head):
        '''
        后序遍历二叉树非递归 后序遍历是 左-右-中
        反过来就是 中-右-左 其实就是先序遍历镜像二叉树(即左右互换)
        :param head: 头节点
        :return: result[::-1] 逆序
        '''
        stack, res = [], []
        if not head:
            return res

        while stack or head:
            while head:
                stack.append(head)
                res.append(head.val)
                head = head.right  # 换成右边

            head = stack.pop()
            head = head.left  # 换成左边
        return res[::-1]


if __name__ == '__main__':
    r = TreeNode(1)
    c21 = TreeNode(2)
    c22 = TreeNode(3)
    c31 = TreeNode(4)
    c32 = TreeNode(5)
    c33 = TreeNode(6)
    c34 = TreeNode(7)
    r.left = c21
    r.right = c22
    r.left.left = c31
    r.left.right = c32
    r.right.left = c33
    r.right.right = c34
    print(Solution().pre_order(r))  # 1245367
    print(Solution().in_order(r))  # 4251637
    print(Solution().post_order(r))  # 4526731