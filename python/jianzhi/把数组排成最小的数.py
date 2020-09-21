"""
题目描述
输入一个正整数数组，把数组里所有数字拼接起来排成一个数，打印能拼接出的所有数字中最小的一个。
例如输入数组{3，32，321}，则打印出这三个数字能排成的最小数字为321323。
"""


# -*- coding:utf-8 -*-
class Solution:
    # 方法：快排思想，选中一个数，把所有排在它左边导致的数字更小的放在左边，反之放在右边
    # time: O(nlogn)->O(n^2)
    # space: O(1)
    def quick_sort(self, numbers, low, high):
        if low >= high:
            return

        target = numbers[low]
        i, j = low + 1, high
        while i < j:
            while numbers[i] + target < target + numbers[i] and i < high:
                i += 1
            while numbers[j] + target > target + numbers[j] and j > low:
                j -= 1

            if i < j:
                numbers[i], numbers[j] = numbers[j], numbers[i]
                i += 1
                j -= 1
        if numbers[j] + target < target + numbers[j]:
            numbers[low], numbers[j] = numbers[j], numbers[low]
        self.quick_sort(numbers, low, j - 1)
        self.quick_sort(numbers, j + 1, high)

    def PrintMinNumber(self, numbers):
        if not numbers or len(numbers) == 0:
            return ""

        numbers = [str(i) for i in numbers]
        self.quick_sort(numbers, 0, len(numbers) - 1)
        return int(''.join(numbers))


if __name__ == '__main__':
    print(Solution().PrintMinNumber([3, 32, 321]))