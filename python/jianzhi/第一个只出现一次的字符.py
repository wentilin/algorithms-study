"""
题目描述
在一个字符串(0<=字符串长度<=10000，全部由字母组成)中找到第一个只出现一次的字符,并返回它的位置,
如果没有则返回 -1（需要区分大小写）.
（从0开始计数）
"""
# -*- coding:utf-8 -*-


class Solution:
    # 方法：哈希表
    # time: O(n)
    # space: O(n)
    def FirstNotRepeatingChar(self, s):
        dic = {}
        for i in s:
            dic[i] = not i in dic

        pos = 0
        for i in s:
            if dic[i]:
                return pos
            pos += 1

        return -1


if __name__ == '__main__':
    print(Solution().FirstNotRepeatingChar("AABBddffc"))
