"""
题目描述
汇编语言中有一种移位指令叫做循环左移（ROL），现在有个简单的任务，就是用字符串模拟这个指令的运算结果。
对于一个给定的字符序列S，请你把其循环左移K位后的序列输出。例如，字符序列S=”abcXYZdef”,要求输出循环左移3位后的结果，
即“XYZdefabc”。是不是很简单？OK，搞定它！
"""


# -*- coding:utf-8 -*-
class Solution:
    # 巧妙的方法：有一种in-place操作，将字符串按原来逆序排列，然后中线再两边分别逆序排列
    # 例如：上述例子先把字符串变成(fedZYX)||(cba), 然后在中间再变成XYZdefabc
    # python string无法修改，只能重新赋值。
    # time: O(n)
    # space: O(n)
    def LeftRotateString(self, s, n):
        if not s or len(s) == 0 or n <= 0:
            return s
        return s[n:] + s[0:n]


if __name__ == '__main__':
    s = "abcXYZdef"
    print(Solution().LeftRotateString(s, 3))