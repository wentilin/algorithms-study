"""
题目描述
对于一个字符串，请设计一个高效算法，计算其中最长回文子串的长度。
给定字符串A以及它的长度n，请返回最长回文子串的长度。

测试样例：
"abc1234321ab",12
返回：7

答案参考
https://leetcode-cn.com/problems/longest-palindromic-substring/solution/zui-chang-hui-wen-zi-chuan-by-leetcode-solution/

"""


class Palindrome1:
    # 方法1: 动态规划，用dp[i][j]表示s[i:j+1](i到j)的是否为回文，d[i][i] = True, d[i][i+1] = s[i] == s[i+1]
    # 方法1: d[i][j] = d[i+1][j-1] and s[i] == s[j]
    # time: O(n^2)
    # space: O(n^2)
    def getLongestPalindrome(self, A, n):
        if not A or n < 0:
            return False
        dp = [[False for _ in range(n)] for _ in range(n)]
        ans = ""
        for l in range(n):  # all length
            for i in range(n):  # start index
                j = i + l
                if j >= n:
                    break
                if j == i:
                    dp[i][j] = True
                elif j == i + 1:
                    dp[i][j] = A[i] == A[j]
                else:
                    dp[i][j] = dp[i + 1][j - 1] and A[i] == A[j]
                if dp[i][j] and l + 1 > len(ans):
                    ans = A[i:j+1]
        return len(ans)


class Palindrome2:
    # 方法2: 从中心扩展，P(i,j)←P(i+1,j−1)←P(i+2,j−2)←⋯←某一边界情况
    # 方法2: 如果两边的字母相同，我们就可以继续扩展，如果两边的字母不同，我们就可以停止扩展，因为在这之后的子串都不能是回文串了。
    # time: O(n^2), 长度为1和2的回文中心分别有n和n-1个，每个回文中心最多向外扩展O(n)次
    # space: O(1)
    def expand_from_center(self, A, left, right):
        while left >= 0 and right < len(A) and A[left] == A[right]:
            left -= 1
            right += 1
        return left + 1, right - 1

    def getLongestPalindrome(self, A, n):
        start, end = 0, 0
        for i in range(n):
            left1, right1 = self.expand_from_center(A, i, i)
            left2, right2 = self.expand_from_center(A, i, i + 1)
            if right1 - left1 > end - start:
                start, end = left1, right1
            if right2 - left2 > end - start:
                start, end = left2, right2
        return end - start + 1


if __name__ == '__main__':
    print(Palindrome1().getLongestPalindrome("abc1234321ab", 12))
    print(Palindrome2().getLongestPalindrome("abc1234321ab", 12))