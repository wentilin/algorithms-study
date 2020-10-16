class MergeSort:
    # 分治法
    # 时间：O(nlogn)[T(n)=2T(n/2)+O(n)]
    # 空间：O(临时数组n + 递归深度logn)->O(n)
    def merge(self, arr, l, mid, r):
        left, right = l, mid + 1
        tmp = []
        while left <= mid and right <= r:
            if arr[left] <= arr[right]:
                tmp.append(arr[left])
                left += 1
            else:
                tmp.append(arr[right])
                right += 1

        while left <= mid:
            tmp.append(arr[left])
            left += 1

        while right <= r:
            tmp.append(arr[right])
            right += 1

        arr[l:r+1] = tmp[:]  # 把tmp赋值给原数组，注意是r+1

    def merge_sort(self, arr, l, r):

        if not arr or l >= r:
            return

        mid = (l + r) // 2
        self.merge_sort(arr, l, mid)
        self.merge_sort(arr, mid + 1, r)
        self.merge(arr, l, mid, r)

    def sort(self, arr):
        if not arr:
            return arr
        self.merge_sort(arr, 0, len(arr) - 1)
        print(arr)


if __name__ == '__main__':
    MergeSort().sort([3, 1, 9, 7, 2])



