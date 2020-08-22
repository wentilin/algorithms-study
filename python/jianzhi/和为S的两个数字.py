"""
题目描述
输入一个递增排序的数组和一个数字S，在数组中查找两个数，
使得他们的和正好是S，如果有多对数字的和等于S，输出两个数的乘积最小的。
"""


# -*- coding:utf-8 -*-
class Solution:
    # 方法：双指针, i=0, j=len-1, 如果比sum大，j左移；否则i右移
    # time: O(n)
    # space: O(1)
    def FindNumbersWithSum(self, array, tsum):
        res = []
        if not array:
            return array

        i, j = 0, len(array) - 1
        while i < j:
            tmp = array[i] + array[j]
            if tmp == tsum:
                break
            elif tmp > tsum:
                j -= 1
            else:
                i += 1

        if i != j:
            res.append(array[i])
            res.append(array[j])
        return res


if __name__ == '__main__':
    print(Solution().FindNumbersWithSum([1, 2, 3, 4, 5], 10))