"""
题目描述
请设计一个函数，用来判断在一个矩阵中是否存在一条包含某字符串所有字符的路径。路径可以从矩阵中的任意一个格子开始，
每一步可以在矩阵中向左，向右，向上，向下移动一个格子。如果一条路径经过了矩阵中的某一个格子，则该路径不能再进入该格子。 例如
[[a b c e],
[s f c s],
[a d e e]]
矩阵中包含一条字符串"bcced"的路径，但是矩阵中不包含"abcb"路径，因为字符串的第一个字符b占据了矩阵中的第一行第二个格子之后，
路径不能再次进入该格子。
"""


# -*- coding:utf-8 -*-
class Solution:
    # 方法：递归
    # time: 从每个矩阵元素开始，从三个方向发散出去查找(第四个方向会立刻返回false，为之前的元素)，最差情况下，O(mn3^k)
    # 最差情况下，可以想象成是个m/n都比较大且除了右下角和其周围的元素不一样，其余都一样，例如
    # [
    # [5 5 5 5],
    # [5 5 5 5],
    # [5 5 2 4],
    # [5 5 3 5]]，这样几乎每条搜索路径都要走接近O(k)的距离
    # space: O(k)->O(mn)
    def hasPath(self, matrix, rows, cols, path):
        def dfs(i, j, k):
            if not 0 <= i < rows or not 0 <= j < cols or visited[i * cols + j] or matrix[i * cols + j] != path[k]:
                return False
            if k == len(path) - 1:
                return True

            visited[i * cols + j] = 1
            res = dfs(i + 1, j, k + 1) or dfs(i - 1, j, k + 1) or dfs(i, j + 1, k + 1) or dfs(i, j - 1, k + 1)
            if not res:
                visited[i * cols + j] = 0
            return res

        if not path or len(path) == 0 or not matrix or len(matrix) == 0:
            return False

        visited = [0 for _ in range(rows * cols)]
        for i in range(0, rows):
            for j in range(0, cols):
                if dfs(i, j, 0):
                    return True
        return False


if __name__ == '__main__':
    print(Solution().hasPath("ABCESFCSADEE",3,4,"ABCB"))