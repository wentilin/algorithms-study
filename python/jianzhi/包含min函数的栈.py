"""
题目描述
定义栈的数据结构，请在该类型中实现一个能够得到栈中所含最小元素的min函数（时间复杂度应为O（1））。
"""


# -*- coding:utf-8 -*-
class Solution:
    def __init__(self):
        self.stack = []
        self.minimum = None

    def push(self, node):
        self.stack.append(node)
        if not self.minimum or node < self.minimum:
            self.minimum = node

    def pop(self):
        if len(self.stack) >= 1:
            if self.minimum == self.top():
                min = None
                for i in range(0, len(self.stack)-1):
                    if not min or self.stack[i] < min:
                        min = self.stack[i]
                self.minimum = min
            self.stack.pop()

    def top(self):
        if len(self.stack) > 0:
            return self.stack[-1]
        else:
            return None

    def min(self):
        return self.minimum


if __name__ == '__main__':
    sol = Solution()
    sol.push(2)
    sol.push(4)
    print(sol.min())  # 2

    sol.pop()
    print(sol.min())  # 2

    sol.push(1)
    print(sol.min())  # 1
    print(sol.top())  # 1

    sol.pop()
    print(sol.min())  # 2

    sol.pop()
    print(sol.min())  # None