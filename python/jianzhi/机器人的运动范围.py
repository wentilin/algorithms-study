"""
题目描述
地上有一个m行和n列的方格。一个机器人从坐标0,0的格子开始移动，每一次只能向左，右，上，下四个方向移动一格，
但是不能进入行坐标和列坐标的数位之和大于k的格子。 例如，当k为18时，机器人能够进入方格（35,37），因为3+5+3+7 = 18。
但是，它不能进入方格（35,38），因为3+5+3+8 = 19。请问该机器人能够达到多少个格子？
"""


# -*- coding:utf-8 -*-
class Solution:
    # 方法：递归, 类似题目"矩阵中的路径"
    # time: O(mn)
    # space: O(m+n)
    def sum_index(self, index):
        sum = 0
        while index % 10:
            sum += index % 10
            index //= 10
        return sum

    def movingCount(self, threshold, rows, cols):

        def dfs(i, j):
            if not 0 <= i < rows or not 0 <= j < cols \
                    or self.sum_index(i) + self.sum_index(j) > threshold\
                    or visited[i * cols + j]:
                return

            visited[i * cols + j] = 1
            self.total += 1

            dfs(i - 1, j)
            dfs(i + 1, j)
            dfs(i, j - 1)
            dfs(i, j + 1)

        if not threshold or threshold < 0 or rows < 0 or cols < 0:
            return 0
        visited = [0 for _ in range(rows * cols)]
        self.total = 0
        dfs(0, 0)
        return self.total

if __name__ == '__main__':
    print(Solution().movingCount(2, 3, 3))
