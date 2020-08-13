"""
题目描述
如何得到一个数据流中的中位数？如果从数据流中读出奇数个数值，那么中位数就是所有数值排序之后位于中间的数值。
如果从数据流中读出偶数个数值，那么中位数就是所有数值排序之后中间两个数的平均值。
我们使用Insert()方法读取数据流，使用GetMedian()方法获取当前读取数据的中位数。
"""


# -*- coding:utf-8 -*-
class Heap:
    def __init__(self, cmp_f):
        self.cmp = cmp_f
        self.heap = []

    def insert(self, num):
        self.heap.append(num)
        i = len(self.heap) - 1
        parent = int((i - 1) / 2)
        while parent >= 0 and i > 0 and self.cmp(self.heap[i], self.heap[parent]):
            self.heap[parent], self.heap[i] = self.heap[i], self.heap[parent]
            i = parent
            parent = int((i - 1) / 2)

    def sift_down(self, i):
        left = 2 * i + 1
        right = 2 * i + 2
        target = i
        if left < len(self.heap) and self.cmp(self.heap[left], self.heap[target]):
            target = left
        if right < len(self.heap) and self.cmp(self.heap[right], self.heap[target]):
            target = right

        if target != i:
            self.heap[target], self.heap[i] = self.heap[i], self.heap[target]
            self.sift_down(target)

    def delete(self):
        if self.size() == 0:
            return None
        self.heap[0], self.heap[-1] = self.heap[-1], self.heap[0]
        elem = self.heap.pop()
        self.sift_down(0)
        return elem

    def size(self):
        return len(self.heap)

    def top(self):
        return self.heap[0]


class Solution:
    # 方法: 最大堆(存放n/2或n/2 + 1个元素) + 最小堆(存放n/2个元素); 如果数据流个数位偶数，中位数是两个堆顶的平均数；否则为最大堆堆顶
    # time: O(nlogn)
    # space: O(n)
    def __init__(self):
        self.max_heap = Heap(lambda x, y: x > y)
        self.min_heap = Heap(lambda x, y: x < y)

    def Insert(self, num):
        # 0 <= len(self.max_heap) - len(self.mmin_heap) <= 1
        if self.max_heap.size() == self.min_heap.size():
            self.min_heap.insert(num)
            self.max_heap.insert(self.min_heap.delete())
        else:
            self.max_heap.insert(num)
            self.min_heap.insert(self.max_heap.delete())

    def GetMedian(self, n=None):
        if self.max_heap.size() == self.min_heap.size():
            return (self.max_heap.top() + self.min_heap.top()) / 2.0
        else:
            return self.max_heap.top() * 1.0


if __name__ == '__main__':
    sol = Solution()
    test = [5, 2, 3, 4, 1, 6, 7, 0]
    for i in test:
        sol.Insert(i)
        print(sol.GetMedian())
