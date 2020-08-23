"""
题目描述
给定一个double类型的浮点数base和int类型的整数exponent。求base的exponent次方。

保证base和exponent不同时为0
"""


# -*- coding:utf-8 -*-
class Solution:
    def power_helper(self, base, exp):
        if exp == 0:
            return 1.0
        # exp为奇数
        res = self.power_helper(base, exp // 2)
        if exp & 1:
            return res * res * base
        else:
            return res * res

    def Power(self, base, exponent):
        if exponent < 0:
            base = 1 / base
            exponent = -exponent
        return self.power_helper(base, exponent)


if __name__ == '__main__':
    print(Solution().Power(2, 4))