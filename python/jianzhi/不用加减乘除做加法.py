"""
题目描述
写一个函数，求两个整数之和，要求在函数体内不得使用+、-、*、/四则运算符号。
"""


# -*- coding:utf-8 -*-
class Solution:
    # 参考：https://zhuanlan.zhihu.com/p/64642722
    def Add(self, num1, num2):
        x = 0xffffffff
        # 本题目的数字范围不会超过32位[-2^31, 2^31-1], 用与运算取出前32位，进行补码之间的运算
        num1, num2 = num1 & x, num2 & x
        # 异或求和，与求进位，正负都可以用这个方法
        while num2:
            # 由于python不规定数据类型，当第32位为1时，左移正常会溢出，得到一个很大的值
            carry = ((num1 & num2) << 1) & x
            num1 = num1 ^ num2  # sum
            num2 = carry  # carry
        # 由于python不规定数据类型, 所以当第32位为1时，我们要手动转成负数
        return num1 if num1 < 0x0111111 else -((num1-1) ^ x)


if __name__ == '__main__':
    print(Solution().Add(1, -1))