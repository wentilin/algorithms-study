"""
题目描述
把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。
输入一个非递减排序的数组的一个旋转，输出旋转数组的最小元素。
例如数组{3,4,5,1,2}为{1,2,3,4,5}的一个旋转，该数组的最小值为1。
NOTE：给出的所有元素都大于0，若数组大小为0，请返回0。
"""


# -*- coding:utf-8 -*-
class Solution:
    # 方法：分治，中位数大于最后一位数，说明最小值在右边，s=mid+1；否则最小值在左边(包括当前mid)，t=mid
    # 可能会出现[1, 1, 1, 1]
    # time: O(logn)
    # space: O(1)
    def minNumberInRotateArray(self, rotateArray):
        if not rotateArray or len(rotateArray) == 0:
            return None

        s, t = 0, len(rotateArray) - 1
        while s < t:
            mid = (s + t) // 2
            if rotateArray[mid] > rotateArray[t]:
                s = mid + 1
            else:
                t = mid

        return rotateArray[s]


if __name__ == '__main__':
    test = [3, 4, 5, 6, 1]
    print(Solution().minNumberInRotateArray(test))
