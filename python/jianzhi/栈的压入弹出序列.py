# -*- coding:utf-8 -*-
"""题目描述
输入两个整数序列，第一个序列表示栈的压入顺序，请判断第二个序列是否可能为该栈的弹出顺序。假设压入栈的所有数字均不相等。
例如序列1,2,3,4,5是某栈的压入顺序，序列4,5,3,2,1是该压栈序列对应的一个弹出序列，
但4,3,5,1,2就不可能是该压栈序列的弹出序列。（注意：这两个序列的长度是相等的）
"""
# 1

class Solution:
    def IsPopOrder(self, pushV, popV):
        # 方法: 新建栈, 栈顶不等于pop则压入，等于弹出
        # time: O(n)
        # space: O(n) 
        if not pushV or not popV or len(pushV) != len(popV):
            return False

        stack = [pushV[0]]
        i, j = 1, 0
        while j < len(popV):
            if stack[len(stack) - 1] == popV[j]:
                j += 1
                stack.pop()
            elif i < len(pushV):
                stack.append(pushV[i])
                i += 1
            # 两种情况均不符合则判断为False并break，否则死循环
            else:
                break
        return len(stack) == 0


if __name__ == '__main__':
    pushV = [1, 2, 3, 4, 5]
    popV_t = [4, 5, 3, 2, 1]
    popV_f = [4, 3, 5, 1, 2]

    sol = Solution()
    print(sol.IsPopOrder(pushV, popV_f))
    print(sol.IsPopOrder(pushV, popV_t))


