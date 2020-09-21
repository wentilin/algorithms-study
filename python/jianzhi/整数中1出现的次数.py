"""
题目描述
求出1~13的整数中1出现的次数,并算出100~1300的整数中1出现的次数？
为此他特别数了一下1~13中包含1的数字有1、10、11、12、13因此共出现6次,但是对于后面问题他就没辙了。
ACMer希望你们帮帮他,并把问题更加普遍化,可以很快的求出任意非负整数区间中1出现的次数（从1 到 n 中1出现的次数）。
"""


# -*- coding:utf-8 -*-
class Solution:
    # 方法：较难，参考https://leetcode-cn.com/problems/1nzheng-shu-zhong-1chu-xian-de-ci-shu-lcof/solution/mian-shi-ti-43-1n-zheng-shu-zhong-1-chu-xian-de-2/
    # time: O(logn)
    # space: O(1)
    def NumberOf1Between1AndN_Solution(self, n):
        div = 1  # 个位为1，十位为10， 百位为10^2
        total = 0 # 记录结果
        high, low, cur = n // 10, 0, n % 10  # 高位，低位，当前位
        while high or cur: # high:1[0]3 or cur:[1]3
            if cur == 0:
                total += high * div
            elif cur == 1:
                total += (high * div + low + 1)
            else:
                total += (high + 1) * div
            low += cur * div
            cur = high % 10
            high //= 10
            div *= 10
        return total


if __name__ == '__main__':
    print(Solution().NumberOf1Between1AndN_Solution(13))


