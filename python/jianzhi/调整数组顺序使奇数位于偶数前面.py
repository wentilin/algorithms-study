"""
题目描述
输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有的奇数位于数组的前半部分，
所有的偶数位于数组的后半部分，并保证奇数和奇数，偶数和偶数之间的相对位置不变。
"""

# 1

# -*- coding:utf-8 -*-
class Solution:
    # 方法: 双指针，慢指针j记录奇数后面第一个偶数的位置(即新的奇数要替换的位置)，快指针i用于遍历
    # time: O(n^2)
    # space: O(1)
    def reOrderArray(self, array):
        if not array or len(array) == 1:
            return array

        j = 0
        for i in range(len(array)):
            if array[i] % 2 != 0:
                k = i
                while k > j:
                    array[k], array[k-1] = array[k-1], array[k]
                    k -= 1
                j += 1
        return array


if __name__ == '__main__':
    array = [1,2,3,4,5,6,7]
    print(Solution().reOrderArray(array))
