"""
题目描述
请实现一个函数，将一个字符串中的每个空格替换成“%20”。例如，当字符串为We Are Happy.则经过替换之后的字符串为We%20Are%20Happy。
"""


# -*- coding:utf-8 -*-
class Solution:
    # 方法一：检测空格+双指针+移动
    # 方法二：列表辅助
    # time：O(n)
    # space：O(n)
    def replaceSpace(self, s):
        l = list(s)
        for i in range(len(s)):
            l[i] = "%20" if l[i] == " " else l[i]
        return "".join(l)


if __name__ == '__main__':
    print(Solution().replaceSpace("We Are Happy"))
