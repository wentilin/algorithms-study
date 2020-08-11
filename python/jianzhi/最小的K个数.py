"""
题目描述
输入n个整数，找出其中最小的K个数。例如输入4,5,1,6,2,7,3,8这8个数字，则最小的4个数字是1,2,3,4。
"""


# -*- coding:utf-8 -*-
class Solution1:
    # 方法: 快排
    # time: O(nlogn)[T(n)=O(n)+2T(n/2)]->O(n^2)[T(n)=O(n)+T(n-1)]
    # space: O(1)
    def partition(self, tinput, l, r):
        if l >= r:
            return tinput

        pivot = tinput[r]
        i, j = l, r - 1
        while i <= j:  # i <= j 等号不能去掉，考虑[3,4]
            while i < r and tinput[i] <= pivot:
                i += 1
            while j >= l and tinput[j] >= pivot:  # j >= l 等号不能去掉, 考虑[4,3], 死循环
                j -= 1
            if j >= l and i <= r and i < j and tinput[i] > pivot > tinput[j]:
                tinput[i], tinput[j] = tinput[j], tinput[i]
                i += 1
                j -= 1

        tinput[i], tinput[r] = tinput[r], tinput[i]
        self.partition(tinput, l, i - 1)
        self.partition(tinput, i + 1, r)
        return tinput

    def GetLeastNumbers_Solution(self, tinput, k):
        if not tinput or k > len(tinput):
            return []
        tinput = self.partition(tinput, 0, len(tinput) - 1)
        return tinput[:k]


# -*- coding:utf-8 -*-
class Solution2:
    # 方法: 最小堆
    def GetLeastNumbers_Solution(self, tinput, k):
        pass


if __name__ == '__main__':
    tinput = [4,5,1,6,2,7,2,8]
    print(Solution1().GetLeastNumbers_Solution(tinput, 2))

