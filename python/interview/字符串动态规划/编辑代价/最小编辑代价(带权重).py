"""
题目描述
给定两个字符串str1和str2，再给定三个整数ic，dc和rc，分别代表插入、删除和替换一个字符的代价，请输出将str1编辑成str2的最小代价。

示例1
输入
"abc","adc",5,3,2
输出
2

示例2
输入
"abc","adc",5,3,100
输出
8
"""

#
# min edit cost
# @param str1 string字符串 the string
# @param str2 string字符串 the string
# @param ic int整型 insert cost
# @param dc int整型 delete cost
# @param rc int整型 replace cost
# @return int整型


class Solution:
    def minEditCost(self, str1, str2, ic, dc, rc):
        m, n = len(str1), len(str2)
        dp = [[0] * (n + 1) for _ in range(m + 1)]

        for i in range(m + 1):
            dp[i][0] = i * dc

        for j in range(n + 1):
            dp[0][j] = j * ic

        for i in range(1, m + 1):
            for j in range(1, n + 1):
                if str1[i - 1] == str2[j - 1]:  # 跳过，不操作
                    dp[i][j] = dp[i - 1][j - 1]
                else:  # str1删除，插入或者替换
                    dp[i][j] = min(dp[i - 1][j] + dc,  # 删除
                                   dp[i][j - 1] + ic,  # 插入
                                   dp[i - 1][j - 1] + rc)  # 替换

        return dp[m][n]


if __name__ == '__main__':
    print(Solution().minEditCost("abc", "adc", 5, 3, 2)) # 2
    print(Solution().minEditCost("abc", "adc", 5, 3, 100)) # 8