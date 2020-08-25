"""
题目描述
将一个字符串转换成一个整数，要求不能使用字符串转换整数的库函数。 数值为0或者字符串不是一个合法的数值则返回0

输入描述:
输入一个字符串,包括数字字母符号,可以为空

输出描述:
如果是合法的数值表达则返回该数字，否则返回0

输入
+2147483647
1a33

输出
2147483647
0
"""


# -*- coding:utf-8 -*-
class Solution:
    # 方法：https://leetcode-cn.com/problems/ba-zi-fu-chuan-zhuan-huan-cheng-zheng-shu-lcof/solution/mian-shi-ti-67-ba-zi-fu-chuan-zhuan-huan-cheng-z-4/
    # time: O(n)
    # space: O(n)
    def StrToInt(self, s):
        ss = s.strip()
        if not ss:
            return 0

        int_max, int_min, boundary = 2 ** 31 - 1, -2 ** 31, 2 ** 31 // 10
        sign, i, res = 1, 1, 0
        if ss[0] == '-':
            sign = -1
        elif ss[0] != '+':
            i = 0

        for v in ss[i:]:
            if not '0' <= v <= '9':
                res = 0
                break
            if res > boundary or res == boundary and v > '7': # v = '8', sign = -1 会被直接返回int_min
                return int_max if sign == 1 else int_min
            res = res * 10 + ord(v) - ord('0')

        return sign * res


if __name__ == '__main__':
    print(Solution().StrToInt("1a33"))