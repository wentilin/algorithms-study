"""
https://www.nowcoder.com/practice/20ef0972485e41019e39543e8e895b7f?tpId=190&&tqId=35361&rp=1&ru=/ta/job-code-high-rd&qru=/ta/job-code-high-rd/question-ranking

题目描述
给出一个整数数组，请在数组中找出两个加起来等于目标值的数，
你给出的函数twoSum 需要返回这两个数字的下标（index1，index2），需要满足 index1 小于index2.。注意：下标是从1开始的
假设给出的数组中只存在唯一解
例如：
给出的数组为 {20, 70, 110, 150},目标值为90
输出 index1=1, index2=2

示例1
输入
[3,2,4],6

输出
[2,3]
"""

# @param numbers int整型一维数组
# @param target int整型
# @return int整型一维数组
#


class Solution:
    def twoSum(self, numbers, target):
        d = dict()
        for i, v in enumerate(numbers):
            if target - v not in d:
                d[v] = i
            else:
                return [d[target - v] + 1, i + 1]


if __name__ == '__main__':
    print(Solution().twoSum([3, 2, 4], 6))

