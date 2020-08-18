"""
题目描述
输入一个整数，输出该数32位二进制表示中1的个数。其中负数用补码表示。
"""


# -*- coding:utf-8 -*-
class Solution:
    def NumberOf1(self, n):
        binary = n & 0xffffffff
        total = 0
        while binary:
            mod = binary % 2
            total += 1 if mod == 1 else 0
            binary = binary >> 1

        return total


if __name__ == '__main__':
    print(Solution().NumberOf1(-1))
