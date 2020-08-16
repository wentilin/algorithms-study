"""
题目描述
用两个栈来实现一个队列，完成队列的Push和Pop操作。 队列中的元素为int类型。
"""

# -*- coding:utf-8 -*-
class Solution:
    def __init__(self):
        self.major = []
        self.helper = []

    def push(self, node):
        self.major.append(node)

    def pop(self):
        if len(self.major) == 0:
            return None

        while len(self.major) > 0:
            self.helper.append(self.major.pop())

        top = self.helper.pop()
        while len(self.helper) > 0:
            self.major.append(self.helper.pop())
        return top


if __name__ == '__main__':
    sol = Solution()
    # sol.push(1)
    # sol.push(2)
    # sol.push(3)

    print(sol.pop())
    print(sol.major)
    print(sol.helper)