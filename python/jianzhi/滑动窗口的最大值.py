"""
题目描述
给定一个数组和滑动窗口的大小，找出所有滑动窗口里数值的最大值。
例如，如果输入数组{2,3,4,2,6,2,5,1}及滑动窗口的大小3，那么一共存在6个滑动窗口，他们的最大值分别为{4,4,6,6,6,5}；
针对数组{2,3,4,2,6,2,5,1}的滑动窗口有以下6个： {[2,3,4],2,6,2,5,1}， {2,[3,4,2],6,2,5,1}，
{2,3,[4,2,6],2,5,1}， {2,3,4,[2,6,2],5,1}， {2,3,4,2,[6,2,5],1}， {2,3,4,2,6,[2,5,1]}。
窗口大于数组长度的时候，返回空
"""


# -*- coding:utf-8 -*-
from collections import deque


class Solution:
    # 方法：双向队列 https://leetcode-cn.com/problems/sliding-window-maximum/solution/3chong-jie-jue-fang-shi-by-sdwwld/
    # 双向队列是用双向链表构建的，两端插入(append/appendleft)和删除(pop/popleft)时间为O(1)
    # 队头维持最大值在列表中的索引，超过滑动窗口立刻删除
    # 往队尾加入新元素时, 保证前面的索引指向的元素都大于它，否则先删除
    # time: O(n)
    # space: O(n)
    def maxInWindows(self, num, size):
        if not num or len(num) == 0 or size <= 0:
            return []

        dq = deque()
        res = []

        for i in range(len(num)):
            # 检查边界，如果队头不在滑动窗口内就删掉
            if dq and dq[0] <= (i - size):
                dq.popleft()

            while dq and num[dq[-1]] < num[i]:
                dq.pop()

            dq.append(i)

            # 当i >= size-1, 开始把队头放进结果
            if i >= size - 1:
                res.append(num[dq[0]])
        return res


if __name__ == '__main__':
    print(Solution().maxInWindows([1, 3, -1, -3, 5, 3, 6, 7], 3))





