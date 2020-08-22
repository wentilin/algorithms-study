"""
题目描述
输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字，
例如，如果输入如下4 X 4矩阵： 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
则依次打印出数字1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10.
"""


# -*- coding:utf-8 -*-
class Solution:
    # 方法：每次执行完一行，就把那一行切掉，并修改边界
    # time: O(nm)
    # space: O(nm)
    def printMatrix(self, matrix):
        if not matrix:
            return matrix
        l = []
        ver_s, ver_d, hor_s, hor_d = 0, len(matrix)-1, 0, len(matrix[0])-1
        iter = 0
        while ver_s <= ver_d and hor_s <= hor_d:
            if iter % 4 == 0:
                for k in range(hor_s, hor_d + 1):
                    l.append(matrix[hor_s][k])
                ver_s += 1
            elif iter % 4 == 1:
                for k in range(ver_s, ver_d + 1):
                    l.append(matrix[k][hor_d])
                hor_d -= 1
            elif iter % 4 == 2:
                for k in reversed(range(hor_s, hor_d + 1)):
                    l.append(matrix[ver_d][k])
                ver_d -= 1
            else:
                for k in reversed(range(ver_s, ver_d + 1)):
                    l.append(matrix[k][hor_s])
                hor_s += 1
            iter += 1
        return l


if __name__ == '__main__':
    # matrix = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]
    matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    print(Solution().printMatrix(matrix))