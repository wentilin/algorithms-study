"""
题目描述
在数组中的两个数字，如果前面一个数字大于后面的数字，则这两个数字组成一个逆序对。
输入一个数组,求出这个数组中的逆序对的总数P。并将P对1000000007取模的结果输出。 即输出P%1000000007
"""


# -*- coding:utf-8 -*-
class Solution:
    # 方法: 归并排序的思想 分治法(divide-and-conquer:将问题分(divide)成一些小的问题然后递归求解)
    # time: O(nlogn)
    # space: O(n)
    def __init__(self):
        self.total = 0

    def merge_sort(self, data, s, t):
        if s == t:
            return

        mid = (s + t) // 2
        self.merge_sort(data, s, mid)
        self.merge_sort(data, mid + 1, t)
        self.merge(data, s, mid + 1, t)

    def merge(self, data, l, mid, r):  # mid: start of right part
        i, j = l, mid
        sorted_res = []
        while i < mid and j <= r:
            if data[i] <= data[j]:
                sorted_res.append(data[i])
                i += 1
            else:
                sorted_res.append(data[j])
                self.total += (mid - i)
                j += 1

        while i < mid:
            sorted_res.append(data[i])
            i += 1

        while j <= r:
            sorted_res.append(data[j])
            j += 1

        data[l:(r+1)] = sorted_res

    def InversePairs(self, data):
        if not data or len(data) == 0:
            return self.total
        self.merge_sort(data, 0, len(data)-1)
        return self.total % 1000000007


if __name__ == '__main__':
    test = [7,5,6,4]
    print(Solution().InversePairs(test))
    print()