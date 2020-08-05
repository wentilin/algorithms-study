"""
题目描述
一只青蛙一次可以跳上1级台阶，也可以跳上2级……它也可以跳上n级。求该青蛙跳上一个n级的台阶总共有多少种跳法。
"""


# -*- coding:utf-8 -*-
class Solution1:
    # 方法: 记忆性递归
    # time: O(n^2)
    # space: O(n)
    def jumpFloorII(self, number):
        if number <= 1:
            return number

        check_list = [0, 1]

        i = 2
        while i <= number:
            total = sum(check_list) + 1
            check_list.append(total)
            i += 1

        return check_list[-1]


class Solution2:
    # 方法: 记忆性递归 找到规律 f[n] = f[n-1] + ...f[0] = 2f[n-1]
    # time: O(n)
    # space: O(n)
    def jumpFloorII(self, number):
        if number <= 2:
            return number

        check_list = [0, 1, 2]

        i = 3
        while i <= number:
            check_list.append(2 * check_list[i - 1])
            i += 1

        return check_list[-1]


class Solution3:
    # 方法: 记忆性递归 找到规律 f[n] = f[n-1] + ...f[0] = 2f[n-1] 改写Solution2
    # time: O(n)
    # space: O(1)
    def jumpFloorII(self, number):
        if number <= 2:
            return number

        check_list = [0, 1, 2]

        i = 3
        prev = check_list[i-1]
        while i <= number:
            prev = 2 * prev
            i += 1

        return prev


if __name__ == '__main__':
    print(Solution1().jumpFloorII(6))
    print(Solution2().jumpFloorII(6))
    print(Solution3().jumpFloorII(6))


