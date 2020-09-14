"""
题目描述
输入n个整数，找出其中最小的K个数。例如输入4,5,1,6,2,7,3,8这8个数字，则最小的4个数字是1,2,3,4。
"""
# 1

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
        if not tinput or k > len(tinput) or k <= 0:
            return []
        tinput = self.partition(tinput, 0, len(tinput) - 1)
        return tinput[:k]


# -*- coding:utf-8 -*-
class Solution2:
    # 方法: 最小堆
    # time: O(klogk + nlogk + klogk) -> O(nlogk)
    # space: O(k)
    def GetLeastNumbers_Solution(self, tinput, k):
        if not tinput or len(tinput) < k or k <= 0:
            return []

        def siftDown(arr, i):
            # 自顶向下调整
            l_child = 2 * i + 1
            r_child = 2 * i + 2

            max_i = i
            if l_child < len(arr) and arr[l_child] > arr[i]:
                max_i = l_child
            if r_child < len(arr) and arr[r_child] > arr[max_i]:
                max_i = r_child

            if max_i != i:
                arr[max_i], arr[i] = arr[i], arr[max_i]
                siftDown(arr, max_i)

        def heapify(arr):
            # 建立一个最大堆
            # 自底向上，对完全二叉树中有孩子的节点进行迭代调整
            for i in reversed(range(0, int(len(tinput)/2))):
                siftDown(arr, i)
            return arr

        heap = heapify(tinput[:k])
        for i in tinput[k:]:
            if i < heap[0]:
                heap[0] = i
                siftDown(heap, 0)

        res = []
        # 依次删除最大堆顶点到堆为空
        while len(heap) > 0:
            res.append(heap[0])
            heap[0] = heap[-1]  # 把最后一个元素放到根节点
            heap.pop()
            siftDown(heap, 0)

        return res[::-1]  # 倒序


if __name__ == '__main__':
    tinput = [4,5,1,6,2,7,2,8]
    print(Solution2().GetLeastNumbers_Solution(tinput, 2))

