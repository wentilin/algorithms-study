"""
题目描述
有一个整数数组，请你根据快速排序的思路，找出数组中第K大的数。
给定一个整数数组a,同时给定它的大小n和要找的K(K在1到n之间)，请返回第K大的数，保证答案存在。
测试样例：
[1,3,5,2,2],5,3
返回：2
"""

# -*- coding:utf-8 -*-

class Finder:
    def quick_sort(self, a, l, r, K):
        if l > r:
            return

        pivot = a[r]
        i, j = l, r - 1
        while i <= j:
            while i < r and a[i] >= pivot:
                i += 1

            # j必须>=l才能到达比i小的地方，跳出循环
            while j >= l and a[j] <= pivot:
                j -= 1

            if i <= r and j >= l and i < j and a[i] < a[j]:
                a[i], a[j] = a[j], a[i]
                i += 1
                j -= 1
        a[i], a[r] = a[r], a[i]

        if i + 1 == K:
            return a[i]
        elif i + 1 < K:
            return self.quick_sort(a, i + 1, r, K) # 要带上return, 注意K不变
        else:
            return self.quick_sort(a, l, i - 1, K) # 要带上return, 注意K不变

    def findKth(self, a, n, K):
        if not a or n == 0:
            return None
        return self.quick_sort(a, 0, n - 1, K)


if __name__ == '__main__':
    print(Finder().findKth([1332802,1177178,1514891,871248,753214,123866,1615405,328656,1540395,968891,1884022,252932,1034406,1455178,821713,486232,860175,1896237,852300,566715,1285209,1845742,883142,259266,520911,1844960,218188,1528217,332380,261485,1111670,16920,1249664,1199799,1959818,1546744,1904944,51047,1176397,190970,48715,349690,673887,1648782,1010556,1165786,937247,986578,798663],49,24))