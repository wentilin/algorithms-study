# -*- coding:utf-8 -*-
"""
题目描述
在一个二维数组中（每个一维数组的长度相同），每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。
请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。
"""


class Solution:
    # array 二维列表
    # time: O(2n) = O(n)
    # space: O(1)
    def Find(self, target, array):
        # 检查输入是否为空
        if len(array) < 1 or len(array[0]) < 1:
            return False

        n_row, n_col = len(array), len(array[0])
        row, col = 0, 0

        # 找到比target小的最大col: O(n)
        if array[row][col] == target:
            return True
        for i in range(1, n_col):
            if array[0][i] == target:
                return True
            if array[0][i] < target:
                col = i

        # target比当前元素大向下; 反之向左; 相等返回True
        # 向下，向左查找: O(n)
        while row < n_row and col >= 0:
            val = array[row][col]
            print(row, col, val)
            if target == val:
                return True
            if val > target:
                col -= 1
            if val < target:
                row += 1
        return False


if __name__ == '__main__':
    array = [[0, 4, 8, 12],
             [1, 5, 10, 13],
             [2, 9, 13, 14],
             [3, 11, 12, 15]]
    # array = [[1,2,8,9],
    #          [2,4,9,12],
    #          [4,7,10,13],
    #          [6,8,11,15]]
    # array = [[]]
    sol = Solution()
    print(sol.Find(15, array))
