"""
题目描述
给定一个double类型的数组arr，其中的元素可正可负可0，返回子数组累乘的最大乘积。
例如arr=[-2.5，4，0，3，0.5，8，-1]，子数组[3，0.5，8]累乘可以获得最大的乘积12，所以返回12。
"""

#
#
# @param arr double浮点型一维数组
# @return double浮点型
#


class Solution:
    # 方法：动态规划，但要考虑负数，最小的也可以变成最大(负数x负数)
    # time: O(n)
    # space: O(n)
    def maxProduct(self, arr):
        if not arr or len(arr) == 0:
            return 0
        max_v = arr[:]  # 深拷贝
        min_v = arr[:]  # 深拷贝
        for i in range(1, len(arr)):
            max_v[i] = max(arr[i], arr[i] * max_v[i - 1], arr[i] * min_v[i - 1])
            min_v[i] = min(arr[i], arr[i] * min_v[i - 1], arr[i] * max_v[i - 1])
        return max(max_v)


if __name__ == '__main__':
    print(Solution().maxProduct([-2.5, 4, 0, 3, 0.5, 8, -1]))
