"""
给你两个单词 word1 和 word2，请你计算出将 word1 转换成 word2 所使用的最少操作数 。

你可以对一个单词进行如下三种操作：

插入一个字符
删除一个字符
替换一个字符
 

示例 1：

输入：word1 = "horse", word2 = "ros"
输出：3
解释：
horse -> rorse (将 'h' 替换为 'r')
rorse -> rose (删除 'r')
rose -> ros (删除 'e')
示例 2：

输入：word1 = "intention", word2 = "execution"
输出：5
解释：
intention -> inention (删除 't')
inention -> enention (将 'i' 替换为 'e')
enention -> exention (将 'n' 替换为 'x')
exention -> exection (将 'n' 替换为 'c')
exection -> execution (插入 'u')

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/edit-distance

讲解参考：https://labuladong.gitbook.io/algo/dong-tai-gui-hua-xi-lie/bian-ji-ju-li
"""


class Solution:
    # 方法：从word1到word2的编辑代价一样，word1插入/删除/替换对应word2删除/插入/替换
    # 方法：动态规划，递归会导致重复调用，所以采用自底向上的方法
    # 方法：dp[i][j]表示word1[0:i]到word2[0:j]的编辑代价, i或j为0时对应空字符
    # time: O(mn)
    # space: O(mn)
    def minDistance(self, word1: str, word2: str) -> int:
        m, n = len(word1), len(word2)
        dp = [[0] * (n + 1) for _ in range(m + 1)]

        for i in range(m + 1):
            dp[i][0] = i

        for j in range(n + 1):
            dp[0][j] = j

        for i in range(1, m + 1):
            for j in range(1, n + 1):
                if word1[i - 1] == word2[j - 1]:  # 跳过，不操作
                    dp[i][j] = dp[i - 1][j - 1]
                else:  # word1删除，插入或者替换
                    dp[i][j] = min(dp[i - 1][j],  # 删除
                                   dp[i][j - 1],  # 插入
                                   dp[i - 1][j - 1]) + 1  # 替换

        return dp[m][n]


if __name__ == '__main__':
    print(Solution().minDistance("horse", "ros"))  # 3
    print(Solution().minDistance("intention", "execution")) # 5
    print(Solution().minDistance("", "a"))  # 1