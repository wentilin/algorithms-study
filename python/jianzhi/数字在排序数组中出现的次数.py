# -*- coding:utf-8 -*-
"""
题目描述
统计一个数字在排序数组中出现的次数。
"""


class Solution1:
    # 方法1：二分查找 + 找到之后在k的周围遍历
    # time: O(logn), 最差O(n)
    # space: O(1)
    def GetNumberOfK(self, data, k):
        if not data or k < data[0] or k > data[-1]:
            return 0

        start, end = 0, len(data) - 1
        while start <= end:
            mid = (start + end) // 2

            if k == data[mid]:
                cnt = 0
                # 最差O(n): 整个数组都是k
                for i in range(start, end + 1):
                    if k == data[i]:
                        cnt += 1
                return cnt

            elif k > data[mid]:
                start = mid + 1

            else:
                end = mid - 1

        return 0


class Solution2:
    # 方法2：二分查找, 找到之后往左往右各二分查找k的上下界
    # time: O(logn)
    # space: O(1)
    def GetNumberOfK(self, data, k):
        if not data or k < data[0] or k > data[-1]:
            return 0

        start, end = 0, len(data) - 1
        while start <= end:
            mid = (start + end) // 2

            if k == data[mid]:
                l_s, l_e = start, mid
                while l_s <= l_e:
                    l_m = (l_s + l_e)//2
                    if data[l_m] < k:
                        l_s = l_m + 1
                    elif data[l_m] == k:
                        l_e = l_e - 1

                r_s, r_e = mid + 1, end
                while r_s <= r_e:
                    r_m = (r_s + r_e) // 2
                    if data[r_m] > k:
                        r_e = r_e - 1
                    elif data[r_m] == k:
                        r_s = r_s + 1

                return r_e - l_s + 1

            elif k > data[mid]:
                start = mid + 1

            else:
                end = mid - 1

        return 0


if __name__ == '__main__':
    data = [1, 2, 3, 3, 3, 3, 3, 3]
    sol_1 = Solution1()
    print(sol_1.GetNumberOfK(data, 3))
    sol_2 = Solution2()
    print(sol_2.GetNumberOfK(data, 3))
