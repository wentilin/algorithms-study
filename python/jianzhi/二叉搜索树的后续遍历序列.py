"""
题目描述
输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历的结果。如果是则输出Yes,否则输出No。
假设输入的数组的任意两个数字都互不相同。
"""

# 1, 2


# -*- coding:utf-8 -*-
class Solution1:
    # 二叉树 后序遍历的规律: [左子树(比根小)|右子树(比根大)|根]
    # time: O(nlogn)->O(n^2) [best:T(n) = n + 2T(n/2): O(nlogn)] [worst: T(n) = n + T(n-1): O(n^2)]
    # space: O(logn)->O(n) [递归深度worst: O(n), 每次需要O(1)空间; best: O(logn)]
    def VerifySquenceOfBST(self, sequence):
        def recur(i, j):
            if i >= j:
                return True
            p = i
            while sequence[p] < sequence[j]:
                p += 1
            mid = p

            while sequence[p] > sequence[j]:
                p += 1

            return p == j and recur(i, mid - 1) and recur(mid, j - 1)
        if not sequence:
            return False
        return recur(0, len(sequence) - 1)


class Solution2:
    # 二叉树 后序遍历的规律: [左子树(比根小)|右子树(比根大)|根]
    # time: O(nlogn)->O(n^2) [best:T(n) = n + 2T(n/2): O(nlogn)] [worst: T(n) = n + T(n-1): O(n^2)]
    # space: O(logn)->O(n) [递归深度worst: O(n), 每次需要O(1)空间; best: O(logn)]
    def find_mid_index(self, sequence, root_val):
        mid = -1
        for i, v in enumerate(sequence):
            if v >= root_val:
                mid = i
                break

        for v in sequence[mid:-1]:
            if v < root_val:
                mid = -1
                break

        return mid

    def VerifySquenceOfBST(self, sequence):
        if not sequence:
            return False

        if len(sequence) <= 2:
            return True

        elif len(sequence) == 3:
            if sequence[0] > sequence[2] > sequence[1]:
                return False
            else:
                return True

        else:
            mid = self.find_mid_index(sequence, sequence[-1])
            if mid == -1:
                return False
            left_seq = sequence[:mid]
            right_seq = sequence[mid:-1]
            if not left_seq:
                return self.VerifySquenceOfBST(right_seq)
            if not right_seq:
                return self.VerifySquenceOfBST(left_seq)
            return self.VerifySquenceOfBST(left_seq) and self.VerifySquenceOfBST(right_seq)


if __name__ == '__main__':
    # seq = [5, 4, 3 ,2 ,1]
    # seq = [4, 8, 6, 12, 16, 14, 10]
    seq = []
    print(Solution1().VerifySquenceOfBST(seq))
