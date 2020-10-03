"""
题目描述
数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。
例如输入一个长度为9的数组{1,2,3,2,2,2,5,4,2}。由于数字2在数组中出现了5次，超过数组长度的一半，因此输出2。如果不存在则输出0。
"""


# 1
# -*- coding:utf-8 -*-
class Solution:
    # 方法: 投票法 最后剩下的数字为众数
    # time: O(n)
    # space: O(1)
    def MoreThanHalfNum_Solution(self, numbers):
        if not numbers or len(numbers) == 0:
            return 0
        votes = 1
        val = numbers[0]
        for i in range(1, len(numbers)):
            if votes == 0:
                val = numbers[i]
                votes = 1
            else:
                if numbers[i] == val:
                    votes += 1
                else:
                    votes -= 1

        if votes == 0:
            return 0

        # 最后要加判断是否存在众数[1, 1, 2, 2, 0]
        cnt = 0
        for i in numbers:
            if i == val:
                cnt += 1
            if cnt > len(numbers) // 2:
                return val
        return 0


if __name__ == '__main__':
    print(Solution().MoreThanHalfNum_Solution([1,2,3,2,4,2,5,2,3]))


