"""
题目描述
请实现一个函数用来判断字符串是否表示数值（包括整数和小数）。
例如，字符串"+100","5e2","-123","3.1416"和"-1E-16"都表示数值。
但是"12e","1a3.14","1.2.3","+-5"和"12e+4.3"都不是。
"""


class Solution:
    # https://leetcode-cn.com/problems/biao-shi-shu-zhi-de-zi-fu-chuan-lcof/solution/mian-shi-ti-20-biao-shi-shu-zhi-de-zi-fu-chuan-y-2/
    # time: O(n)
    # space: O(1)
    def isNumeric(self, s):
        states = [
            {' ': 0, 's': 1, 'd': 2, '.': 4}, # 0. start with 'blank'
            {'d': 2, '.': 4},                 # 1. 'sign' before 'e'
            {'d': 2, '.': 3, 'e': 5, ' ': 8}, # 2. 'digit' before 'dot'
            {'d': 3, 'e': 5, ' ': 8},         # 3. 'digit' after 'dot'
            {'d': 3},                         # 4. 'digit' after 'dot' (‘blank’ before 'dot')
            {'s': 6, 'd': 7},                 # 5. 'e'
            {'d': 7},                         # 6. 'sign' after 'e'
            {'d': 7, ' ': 8},                 # 7. 'digit' after 'e'
            {' ': 8}                          # 8. end with 'blank'
        ]
        p = 0                           # start with state 0
        for c in s:
            if '0' <= c <= '9':
                t = 'd'  # digit
            elif c in "+-":
                t = 's'     # sign
            elif c in "eE":
                t = 'e'     # e or E
            elif c in ". ":
                t = c       # dot, blank
            else:
                t = '?'               # unknown
            if t not in states[p]:
                return False
            p = states[p][t]
            print(p)
        return p in (2, 3, 7, 8)


if __name__ == '__main__':
    print(Solution().isNumber('23e1'))