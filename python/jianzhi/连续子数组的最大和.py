"""
题目描述
HZ偶尔会拿些专业问题来忽悠那些非计算机专业的同学。今天测试组开完会后,他又发话了:在古老的一维模式识别中,
常常需要计算连续子向量的最大和,当向量全为正数的时候,问题很好解决。但是,如果向量中包含负数,是否应该包含某个负数,
并期望旁边的正数会弥补它呢？例如:{6,-3,-2,7,-15,1,2,2},连续子向量的最大和为8(从第0个开始,到第3个为止)。
给一个数组，返回它的最大连续子序列的和，你会不会被他忽悠住？(子向量的长度至少是1)
"""

# 1, 2


# -*- coding:utf-8 -*-
class Solution:
    # 方法: 动态规划 cur[i] = max(cur[i-1]+array[i], array[i])
    # time: O(n)
    # space: O(n)
    def FindGreatestSumOfSubArray(self, array):
        if not array:
            return array

        cur = [array[0]]
        max_val = array[0]
        for i in range(1, len(array)):
            val = max(array[i], cur[i-1] + array[i])
            max_val = val if val > max_val else max_val
            cur.append(val)
        return max_val


if __name__ == '__main__':
    print(Solution().FindGreatestSumOfSubArray([6,-3,-2,7,-15,1,2,2]))

