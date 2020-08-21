"""
题目描述
一个整型数组里除了两个数字之外，其他的数字都出现了两次。请写程序找出这两个只出现一次的数字。

返回[a,b] 其中ab是出现一次的两个数字
"""


# -*- coding:utf-8 -*-
class Solution:
    # 方法：a ^ 0 = a, a ^ a = 0, 异或^满足交换结合律
    def FindNumsAppearOnce(self, array):
        res = 0 # 初始化为0，a ^ 0 = a
        for i in array:
            res ^= i

        # res中，为1的位数是两个不同的数字导致的
        # 与&运算找出第一个为1的低位，用h表示
        h = 1
        while res & h == 0:
            h <<= 1

        # 两个只出现一次的数字，和h做与运算的结果肯定不一样
        # 将得到的结果h, 再依次与数组中元素执行按位与，为0的分一组，为1的分一组，这样可以将数组的元素分为两组，
        # 这两组元素满足两个条件，出现两次的数字都在一组，只出现一次的数字各在其中一组。两组元素各自依次异或，就是这两个值。
        nums = [0, 0]
        for i in array:
            if i & h == 0:
                nums[0] ^= i
            else:
                nums[1] ^= i

        return nums


if __name__ == '__main__':
    print(Solution().FindNumsAppearOnce([1,2,3,2]))

