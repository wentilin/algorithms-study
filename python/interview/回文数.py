"""
9. 回文数

判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

示例 1:

输入: 121
输出: true
示例 2:

输入: -121
输出: false
解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
示例 3:

输入: 10
输出: false
解释: 从右向左读, 为 01 。因此它不是一个回文数。
进阶:

你能不将整数转为字符串来解决这个问题吗？
"""

# 1


class Solution:
    # 方法：负数或者结尾为0的数字都不是回文；然后对整数后面一半的数字进行颠倒，看是不是和前面一半相同
    # 注意//和int()都是round down, math.ceil()是round up, 而/会直接得到float
    # 时间：O(n)
    # 空间：O(1)
    def isPalindrome(self, x: int) -> bool:
        if x < 0 or x % 10 == 0 and x != 0:
            return False

        reverse = 0
        while x > reverse:
            tmp = x % 10
            x //= 10 # 注意这一步不能是x /= 10, 否则x为float
            reverse = 10 * reverse + tmp

        return x == reverse or x == reverse // 10  # 偶数位和奇数位(reverse为x的10倍, 注意是//而不是/)


if __name__ == '__main__':
    print(Solution().isPalindrome(0))
    print(Solution().isPalindrome(121))
    print(Solution().isPalindrome(1221))
    print(Solution().isPalindrome(-121))
    print(Solution().isPalindrome(10))









