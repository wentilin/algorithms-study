"""
题目描述
给出一个仅包含字符'(',')','{','}','['和']',的字符串，判断给出的字符串是否是合法的括号序列
括号必须以正确的顺序关闭，"()"和"()[]{}"都是合法的括号序列，但"(]"和"([)]"不合法。


示例1：
输入
"["
输出
false


示例2：
输入
"[]"
输出
true
"""

# 1


class Solution:
    def isValid(self, s):
        stack = []
        map = {')': '(', '}': '{', ']': '['}
        for ch in s:
            if ch in map.values():
                stack.append(ch)
            elif ch in map.keys():
                if len(stack) > 0 and stack[-1] == map.get(ch):
                    stack.pop()
                else:
                    return False
        return True if len(stack) == 0 else False


if __name__ == '__main__':
    print(Solution().isValid("[]()"))

