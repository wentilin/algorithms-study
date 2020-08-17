"""
题目描述
求1+2+3+...+n，要求不能使用乘除法、for、while、if、else、switch、case等关键字及条件判断语句（A?B:C）。
"""


# -*- coding:utf-8 -*-
class Solution:
    # 方法: false结果返回0 (f(0)=0)，true结果返回n+f(n-1)
    # time: O(n)
    # space: O(1)
    def Sum_Solution(self, n):
        return n >= 1 and n + self.Sum_Solution(n-1)


if __name__ == '__main__':
    print(Solution().Sum_Solution(4))