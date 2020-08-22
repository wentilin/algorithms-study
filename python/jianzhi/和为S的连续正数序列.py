"""
题目描述
小明很喜欢数学,有一天他在做数学作业时,要求计算出9~16的和,他马上就写出了正确答案是100。但是他并不满足于此,
他在想究竟有多少种连续的正数序列的和为100(至少包括两个数)。没多久,他就得到另一组连续正数和为100的序列:18,19,20,21,22。
现在把问题交给你,你能不能也很快的找出所有和为S的连续正数序列? Good Luck!

输出描述:
输出所有和为S的连续正数序列，二维数组。序列内按照从小至大的顺序，序列间按照开始数字从小到大的顺序
"""


# -*- coding:utf-8 -*-
class Solution:
    # 方法：双指针i, j表示滑动窗口范围和一个保留当前和的整数total，i,j只能向右移动，保证复杂度为n，不回溯。
    # 如果total == sum, 则i, j同时右移，更新total
    # 如果total < sum，说明j需要往右移动，更新total
    # 如果total > sum，说明要固定j，增大i，检索j左边的区域
    # time: O(n)
    # space: O(1), 除去存结果的二维数组
    def FindContinuousSequence(self, tsum):
        res = []
        if tsum < 3:
            return res
        i, j, total = 1, 2, 3
        while i < j <= tsum:
            if total == tsum:
                tmp = []
                for k in range(i, j+1):
                    tmp.append(k)
                res.append(tmp)
                total -= i
                i += 1
                j += 1
                total += j
            elif total < tsum:
                j += 1
                total += j
            elif total > tsum:
                total -= i
                i += 1
            if i == j:
                j += 1
                total += j
            if i >= tsum:
                break
            # print(i, j, total)

        return res


if __name__ == '__main__':
    res = Solution().FindContinuousSequence(9)
    print(res)

