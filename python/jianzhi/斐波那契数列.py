"""
题目描述
大家都知道斐波那契数列，现在要求输入一个整数n，请你输出斐波那契数列的第n项（从0开始，第0项为0，第1项是1）。
n<=39
"""


# -*- coding:utf-8 -*-
class Solution:
    # 方法: 循环 (递归存在重复计算)
    # time: O(n)
    # space: O(1)
    def Fibonacci(self, n):
        if n < 2:
            return n

        first = 0
        second = 1

        i = 2
        while i <= n:
            curr = first + second
            first = second
            second = curr
            i += 1

        return second


if __name__ == '__main__':
    print(Solution().Fibonacci(39))