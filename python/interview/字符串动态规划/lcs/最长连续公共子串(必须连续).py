"""
718. Maximum Length of Repeated Subarray

https://leetcode.com/problems/maximum-length-of-repeated-subarray/

Given two integer arrays A and B, return the maximum length of an subarray that appears in both arrays.

Example 1:

Input:
A: [1,2,3,2,1]
B: [3,2,1,4,7]
Output: 3
Explanation:
The repeated subarray with maximum length is [3, 2, 1].


Note:

1 <= len(A), len(B) <= 1000
0 <= A[i], B[i] < 100
"""


class Solution:
    # 方法：二维动态规划，dp[i][j]表示text1[0:i]和text2[0:j]的lcs的长度, i或j为0表示空字符""
    # time: O(mn)
    # space: O(mn)
    # 对比"最长公共子序列"
    def findLength(self, A, B):
        m, n = len(A), len(B)
        dp = [[0] * (n + 1) for _ in range(m + 1)]
        max_len = 0
        for i in range(1, m + 1):
            for j in range(1, n + 1):
                if A[i - 1] == B[j - 1]:
                    dp[i][j] = dp[i - 1][j - 1] + 1
                    max_len = dp[i][j] if dp[i][j] > max_len else max_len
        return max_len


if __name__ == '__main__':
    print(Solution().findLength([1,2,3,2,1], [3,2,1,4,7]))
















