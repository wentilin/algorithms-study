"""
题目描述
我们可以用2*1的小矩形横着或者竖着去覆盖更大的矩形。请问用n个2*1的小矩形无重叠地覆盖一个2*n的大矩形，总共有多少种方法？

比如n=3时，2*3的矩形块有3种覆盖方法：
https://www.nowcoder.com/practice/72a5a919508a4251859fb2cfb987a0e6?tpId=13&&tqId=11163&rp=1&ru=/ta/coding-interviews&qru=/ta/coding-interviews/question-ranking
"""


# -*- coding:utf-8 -*-
class Solution:
    # 方法: 记忆性递归 f[n] = f[n-1]+f[n-2], 在f[n-1]加一个竖的或者在f[n-2]加两个横的
    # time: O(n)
    # space: O(1)
    def rectCover(self, number):
        if number <= 0:
            return 0
        if number <= 2:
            return number

        first, second = 1, 2
        for i in range(3, number+1):
            tmp = first + second
            first = second
            second = tmp
        return second


if __name__ == '__main__':
    print(Solution().rectCover(4))
