"""
470. 用 Rand7() 实现 Rand10()

注: 从 https://leetcode-cn.com/problems/implement-rand10-using-rand7/solution/xiang-xi-si-lu-ji-you-hua-si-lu-fen-xi-zhu-xing-ji/
参考以上包含：rand10到rand7

已有方法 rand7 可生成 1 到 7 范围内的均匀随机整数，试写一个方法 rand10 生成 1 到 10 范围内的均匀随机整数。

不要使用系统的 Math.random() 方法。

示例 1:

输入: 1
输出: [7]
示例 2:

输入: 2
输出: [8,4]
示例 3:

输入: 3
输出: [8,1,10]


提示:

rand7 已定义。
传入参数: n 表示 rand10 的调用次数。


进阶:

rand7()调用次数的 期望值 是多少 ?
你能否尽量少调用 rand7() ?
"""


def rand7():
    return 1


class Solution:
    def rand10(self):
        """
        :rtype: int
        """
        while True:
            a = (rand7() - 1) * 7 + rand7()  # [1, 49]
            if a <= 40:
                return (a - 1) % 10 + 1
            a = a - 40  # [41, 49] -> [1, 9]一共9个数
            b = (a - 1) * 7 + rand7() # [1, 63]
            if b <= 60:
                return (b - 1) % 10 + 1
            a = b - 60 # [61, 63] -> [1, 3]一共3个数
            b = (a - 1) * 7 + rand7() # [1, 21]
            if b <= 20:
                return (b - 1) % 10 + 1




