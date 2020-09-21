"""
题目描述
把只包含质因子2、3和5的数称作丑数（Ugly Number）。例如6、8都是丑数，但14不是，因为它包含质因子7。
习惯上我们把1当做是第一个丑数。
求按从小到大的顺序的第N个丑数。
"""


# -*- coding:utf-8 -*-
class Solution:
    # 方法：动态规划 https://leetcode-cn.com/problems/chou-shu-lcof/solution/mian-shi-ti-49-chou-shu-dong-tai-gui-hua-qing-xi-t/
    # time: O(n)
    # time: O(n)
    def GetUglyNumber_Solution(self, index):
        if index <= 0:
            return 0
        dp, a, b, c = [1] * index, 0, 0, 0
        for i in range(1, index):
            n2, n3, n5 = dp[a] * 2, dp[b] * 3, dp[c] * 5
            dp[i] = min(n2, n3, n5)
            if dp[i] == n2:
                a += 1
            if dp[i] == n3:
                b += 1
            if dp[i] == n5:
                c += 1
        return dp[-1]





