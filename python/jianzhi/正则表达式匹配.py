"""
题目描述
请实现一个函数用来匹配包括'.'和'*'的正则表达式。模式中的字符'.'表示任意一个字符，而'*'表示它前面的字符可以出现任意次（包含0次）。
在本题中，匹配是指字符串的所有字符匹配整个模式。例如，字符串"aaa"与模式"a.a"和"ab*ac*a"匹配，但是与"aa.a"和"ab*a"均不匹配
class Solution:
    def isMatch(self, s: str, p: str) -> bool:
        m, n = len(s), len(p)

        def matches(i: int, j: int) -> bool:
            if i == 0:
                return False
            if p[j - 1] == '.':
                return True
            return s[i - 1] == p[j - 1]

        f = [[False] * (n + 1) for _ in range(m + 1)]
        f[0][0] = True
        for i in range(m + 1):
            for j in range(1, n + 1):
                if p[j - 1] == '*':
                    f[i][j] |= f[i][j - 2]
                    if matches(i, j - 1):
                        f[i][j] |= f[i - 1][j]
                else:
                    if matches(i, j):
                        f[i][j] |= f[i - 1][j - 1]
        return f[m][n]

"""


# -*- coding:utf-8 -*-
class Solution:
    # i, j从0开始，表示空字符

    def match(self, s, pattern):
        def equal_or_match(i, j):
            if i == 0:  # 对付s = ""， p = "."
                return False
            if pattern[j - 1] == '.' or pattern[j - 1] == s[i - 1]:
                return True
            return False

        m, n = len(s), len(pattern)
        f = [[False] * (n + 1) for _ in range(m + 1)]  # f[i][0] = False for i > 0
        f[0][0] = True
        for i in range(m + 1): # 要从0开始，比如s = ""， p = "5*"
            for j in range(1, n + 1):
                if pattern[j - 1] == '*':
                    if equal_or_match(i, j - 1):
                        f[i][j] = f[i - 1][j] | f[i][j - 2]
                    else:
                        f[i][j] |= f[i][j - 2]
                else:
                    # p[j]是字母或者'.'
                    if equal_or_match(i, j):
                        f[i][j] |= f[i - 1][j - 1]

        return f[m][n]


if __name__ == '__main__':
    # print(Solution().match("aaa", "a.a"))
    # print(Solution().match("aaa", "ab*ac*a"))
    # print(Solution().match("aa.a", "ab*a"))
    # print(Solution().match("", ".*"))
    print(Solution().match("", "5"))
    # print(Solution().match("a", "."))
    # print(Solution().match("", ".*"))
