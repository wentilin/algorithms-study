"""
题目描述
一只青蛙一次可以跳上1级台阶，也可以跳上2级。求该青蛙跳上一个n级的台阶总共有多少种跳法（先后次序不同算不同的结果）。
"""

# 1

# -*- coding:utf-8 -*-
class Solution1:
    # 方法: 迭代 记忆性递归
    # time: O(n)
    # space: O(1)
    def jumpFloor(self, number):
        if number <= 2:
            return number

        check_list = [0, 1, 2]

        i = 3
        while i <= number:
            check_list.append(check_list[i - 1] + check_list[i - 2])
            i += 1

        return check_list[-1]


if __name__ == '__main__':
    print(Solution1().jumpFloor(4))

