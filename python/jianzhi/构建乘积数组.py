"""
题目描述
给定一个数组A[0,1,...,n-1],请构建一个数组B[0,1,...,n-1],
其中B中的元素B[i]=A[0]*A[1]*...*A[i-1]*A[i+1]*...*A[n-1]。不能使用除法。
（注意：规定B[0] = A[1] * A[2] * ... * A[n-1]，B[n-1] = A[0] * A[1] * ... * A[n-2];）
对于A长度为1的情况，B无意义，故而无法构建，因此该情况不会存在。
"""


# -*- coding:utf-8 -*-
class Solution:
    # 方法: B[i] = Left[i] * Right[i]; Left[i+1] = Left[i] * A[i]; Right[i] = Right[i+1] * A[i+1]
    # time: O(n)
    # space: O(n)
    def multiply(self, A):
        left, right = [1] * len(A), [1] * len(A)
        for i in range(1, len(A)):
            left[i] = left[i-1] * A[i-1]

        for i in reversed(range(0, len(A) - 1)):
            right[i] = right[i+1] * A[i+1]

        print(left)
        print(right)
        return [left[i] * right[i] for i in range(len(A))]


if __name__ == '__main__':
    A = [1,2,3,4,5]
    print(A)
    print(Solution().multiply(A))