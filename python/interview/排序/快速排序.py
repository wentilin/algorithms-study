class QuickSort:
    # 分治法
    # 时间：O(nlogn)[T(n)=2T(n/2)+O(n)]->O(n^2)[T(n)=T(n-1)+O(n)]
    # 空间：O(最差递归深度n)->O(n)
    def partition(self, tinput, l, r):
        if l >= r:
            return tinput

        pivot = tinput[r]
        i, j = l, r - 1
        while i <= j:  # i <= j 等号不能去掉，考虑[4,3]
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

    def quick_sort(self, tinput):
        if not tinput:
            return []
        tinput = self.partition(tinput, 0, len(tinput) - 1)
        print(tinput)


if __name__ == '__main__':
    QuickSort().quick_sort([3, 1, 9, 7, 2])


