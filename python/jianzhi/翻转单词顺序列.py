"""
题目描述
牛客最近来了一个新员工Fish，每天早晨总是会拿着一本英文杂志，写些句子在本子上。同事Cat对Fish写的内容颇感兴趣，有一天他向Fish借来翻看，
但却读不懂它的意思。例如，“student. a am I”。后来才意识到，这家伙原来把句子单词的顺序翻转了，正确的句子应该是“I am a student.”。
Cat对一一的翻转这些单词顺序可不在行，你能帮助他么？
"""


# -*- coding:utf-8 -*-
class Solution:
    # 方法: 双指针，一起从尾部出发往前移动
    # time: O(n)
    # space: O(n)
    def ReverseSentence(self, s):
        # s = "   "，output "   "
        tmp = s
        if len(tmp.strip()) <= 1:
            return s

        s = s.strip()
        i, j = len(s) - 1, len(s) - 1
        res = []
        while i >= 0:
            while i >= 0 and s[i] != " ":
                i -= 1
            res.append(s[i + 1: j + 1])

            while s[i] == " ":
                i -= 1

            j = i

        return " ".join(res)


if __name__ == '__main__':
    s = " "
    print(Solution().ReverseSentence(s))